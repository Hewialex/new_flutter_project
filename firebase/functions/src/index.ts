/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import { CallableRequest, onCall, HttpsError } from "firebase-functions/v2/https";
import * as functions from "firebase-functions";
import * as logger from "firebase-functions/logger";
import * as admin from 'firebase-admin';   // admin sdk required to interact with the firebase services
import * as path from "path";


// library for image resizing
const sharp = require("sharp");

admin.initializeApp();

// admin.(auth, "http://localhost:9099");
admin.firestore().settings({ ignoreUndefinedProperties: true });


const defaultNotificationSettings = {
  // who added me to favorite list
  addedToFavoriteList: true,
  // when someone allows me to view their photo
  allowedToViewMyPhoto: true,
  // when I get new messages
  newMessages: true,
  // who saw my profile
  profileViewed: true,
  // who added me to their ignore list
  addedToIgnoreList: true,
}

const defaultAccountSettings = {}

const defaultGeneralSettings = { appearOnSearch: true }

// fired when a new user account is created
export const userCreated = functions.auth.user().onCreate(async (user) => {
  logger.log('User created', user.email, user.uid);

  // create a users allowed to see my photo document with an empty list as a value
  await admin.firestore().collection('profilePhotoViewAllowedList').doc(user.uid).create({
    "allowedUsersIds": []
  });

  // create a list of users who current user can add to ignore list
  await admin.firestore().collection('ignoredUsersList').doc(user.uid).create({
    "ignoredUsersList": []
  });

  // create a list of users who current user can add to favorite list
  await admin.firestore().collection('likedUsersList').doc(user.uid).create({
    "likedUsersList": []
  });

  // create a notification settings with default values
  await admin.firestore().collection('notificationSettings').doc(user.uid).create(defaultNotificationSettings);

  // create an account settings with default values
  await admin.firestore().collection('accountSettings').doc(user.uid).create(defaultAccountSettings);

  // create a general settings with default values
  await admin.firestore().collection('generalSettings').doc(user.uid).create(defaultGeneralSettings);

  // send a verification email if the user signed in with email and password
  // if (user.providerData.some(provider => provider.providerId === 'password') && !user.emailVerified) {
  //   const verificationLink = await admin.auth().generateEmailVerificationLink(user.email!);

  //   // send a verification email
  // }

  // Must return a value or a promise
  return new Promise((resolve, _) => {
    resolve(logger.info('User created', user.email, user.uid));
  });
});

// fired when a user account is deleted
export const userDeleted = functions.auth.user().onDelete(async (user) => {
  logger.log('User deleted', user.email, user.uid);
  // delete user profile
  await admin.firestore().collection('users').doc(user.uid).delete();

  // delete the user's profile photo and it's thumbnail
  await admin.storage().bucket().file(`userProfileImages/${user.uid}`).delete();
  await admin.storage().bucket().file(`userProfileImages/thumbnails/${user.uid}`).delete();

  // delete the profile photo from the allowed list of all users
  await admin.firestore().collection('profilePhotoViewAllowedList').doc(user.uid).delete();

  // delete the ignord users list of the deleted user
  await admin.firestore().collection('ignoredUsersList').doc(user.uid).delete();

  // delete the liked users list of the deleted user
  await admin.firestore().collection('likedUsersList').doc(user.uid).delete();

  // delete the notifications of the current user
  await admin.firestore().collection('notificationSettings').doc(user.uid).delete();

  // delete the account settings of the current user
  await admin.firestore().collection('accountSettings').doc(user.uid).delete();

  // delete the general settings of the current user
  await admin.firestore().collection('generalSettings').doc(user.uid).delete();
  
  // // set the thumbnail of the user as the profile photo of the user
  // await admin.auth().updateUser(user.uid, { photoURL: `https://firebasestorage.googleapis.com/v0/b/${admin.storage().bucket().name}/o/userProfileImages%2Fthumbnails%2Fdefault-profile-image.png?alt=media` })

  // Must return a value or a promise
  return new Promise((resolve, _) => {
    resolve(logger.info('User deleted', user.email, user.uid));
  });
});


// Common fields for both men and women
interface GenderCommonUserFields {
  username: string;
  fullname: string;
  phone: string;
  nationality: string;
  country: string;
  city: string;
  mariageStatus: string;
  mariageType: string;
  age: number;
  children: number;
  weight: number; // in kgs
  height: number; // in cm
  skinColor: string;
  bodyShape: string;
  religionCommitment: string;
  prayer: string;
  smoking: boolean;
  educationalQualification: string;
  financialStatus: string;
  jobCategory: string;
  job: string;
  monthlyIncome: number;
  healthCare: string;
  aboutYourPartner: string;
  aboutYourself: string;
}


const genderCommonUserFieldsList = [
  'username', 'fullname', 'phone', 'nationality', 'country', 'city', 'mariageStatus',
  'mariageType', 'age', 'children', 'weight', 'height', 'skinColor', 'bodyShape',
  'religionCommitment', 'prayer', 'smoking', 'educationalQualification', 'financialStatus',
  'jobCategory', 'job', 'monthlyIncome', 'healthCare', 'aboutYourPartner', 'aboutYourself'
];

interface User extends GenderCommonUserFields {
  gender: 'male' | 'female';
  beard?: boolean;
  veil?: boolean;
  [key: string]: any;
}

// Create a user profile
export const createUserProfile = onCall(async (request: CallableRequest<User>) => {
  const uid: string = request.auth?.uid!;

  // check if the user email is verified
  const userRecord = await admin.auth().getUser(uid);
  if (!userRecord.emailVerified) {
    throw new HttpsError('unauthenticated', 'Email not verified yet, please verify your email before proceeding to create a profile');
  }
  
  const data = request.data;
  
  // validate user data
  if (!data.gender || (data.gender !== 'male' && data.gender !== 'female')) {
    throw new HttpsError('invalid-argument', `Invalid Gender, Choose either male or female`);
  }

  // All common fields exist
  genderCommonUserFieldsList.forEach(field => {
    if (!data[field]) {
      throw new HttpsError('invalid-argument', `Field ${field} is required`);
    }
  });

  if (data.age < 18) {
    throw new HttpsError('invalid-argument', 'You must be 18 years or older to create a profile');
  }

  // male should have the beard field
  if (data.gender === 'male' && data.beard === undefined) {
    throw new HttpsError('invalid-argument', 'Field beard is required');
  }
  
  // female should have the veil field
  if (data.gender === 'female' && data.veil === undefined) {
    throw new HttpsError('invalid-argument', 'Field veil is required');
  }

  // Create a new user profile
  const userProfile = await admin.firestore().collection('users').doc(uid).create(data);

  return {
    "message": "profile created successfully",
    ...userProfile
  };
});


/**
 * When an image is uploaded in the Storage bucket,
 * generate a blurred thumbnail image automatically using sharp.
 */
exports.generateThumbnail = functions.storage.object().onFinalize(async (object) => {
  const fileBucket = object.bucket!; // Storage bucket containing the file.
  const filePath = object.name!; // File path in the bucket.
  const contentType = object.contentType!; // File content type.

    // Exit if this is triggered on a file that is not an image.
    if (!contentType.startsWith("image/")) {
      return logger.log("This is not an image.");
    }

    const fileName = path.basename(filePath);
    // if upload was made to the thumbnail folder, exit
    if (filePath.includes("userProfileImages/thumbnails")) {
      return logger.log("Ignoring a thumbnail upload.");
    }

    // Download file from bucket.
    const bucket = admin.storage().bucket(fileBucket);
    const downloadResponse = await bucket.file(filePath).download();
    const imageBuffer = downloadResponse[0];
    logger.log("User Image downloaded!");

    // Generate a thumbnail using sharp.
    const thumbnailBuffer = await sharp(imageBuffer).blur(35).toBuffer();
    
    logger.log("Blurred thumbnail created from user image!");

    // I want to store it in an adjacent folder named thumbnailUserProfileImages
    const thumbFilePath = path.join(path.dirname(filePath), 'thumbnails', fileName);
    
    // upload the thumbnail
    const metadata = {contentType: contentType};
    await bucket.file(thumbFilePath).save(thumbnailBuffer, {
      metadata: metadata,
    });

    return logger.log("Blurred thumbnail uploaded from user profile!");
});

type notificationType = 'like' | 'message' | 'profileViewed' | 'addedToFavoriteList' | 'addedToIgnoreList' | 'ignore';

const pushNotification = async ({
  userId,
  notificationTitle,
  notificationContent,
  notificationType
} : {
  userId: string;
  notificationTitle: string;
  notificationContent: string;
  notificationType: notificationType;
}) => {

  await admin.firestore().collection('notifications').add({
    userId,
    notificationTitle,
    notificationContent,
    notificationType,
    read: false,
    createdAt: admin.firestore.FieldValue.serverTimestamp()
  });
};


/**
 * When a user likes another user a chat room is created between them
 * and the user who was liked is notified.
 */
exports.likeUser = onCall(async (request: CallableRequest<{ userId: string }>) => {
  const uid: string = request.auth?.uid!;
  const data = request.data;
  const currUser = await admin.auth().getUser(uid);
  
  // check if the liked user exists
  const likedUser = await admin.auth().getUser(data.userId);
  if (!likedUser)
    throw new HttpsError('not-found', 'User not found');

  // add the liked user to the current user's liked users list
  await admin.firestore().collection('likedUsersList').doc(uid).update({
    likedUsersList: admin.firestore.FieldValue.arrayUnion(data.userId)
  });

  // check if the other user likes the current user
  const likedUserLikedCurrentUser = await admin.firestore().collection('likedUsersList').doc(data.userId).get();

  if (likedUserLikedCurrentUser.data()?.likedUsersList.includes(uid)) {
    // create a chat room between the two users
    await admin.firestore().collection('chatRooms').add({
      users: [uid, data.userId],
      archived: false,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });

    // notify the liked user
    await pushNotification({
      userId: data.userId,
      notificationTitle: 'New Like',
      notificationContent: `${currUser} liked you`,
      notificationType: 'like'
    });
  }

  await pushNotification({
    userId: data.userId,
    notificationTitle: 'New Like',
    notificationContent: `${currUser} liked you`,
    notificationType: 'like'
  });
});


/**
 * When a user dislikes/ignores another user, the other user is notified
 * and removed from the liked list and added to the ignored list
 */
exports.ignoreUser = onCall(async (request: CallableRequest<{userId: string}>) => {
  const uid: string = request.auth?.uid!;
  const data = request.data;
  const currUser = await admin.auth().getUser(uid);
  
  // check if the liked user exists
  const dislikedUser = await admin.auth().getUser(data.userId);
  if (!dislikedUser)
    throw new HttpsError('not-found', 'User not found');

  
  // add the liked user to the current user's liked users list
  await admin.firestore().collection('ignoredUsersList').doc(uid).update({
    ignoredUsersList: admin.firestore.FieldValue.arrayUnion(data.userId)
  });

  // if these two users had a chat started archive the chat
  const chatRoom = await admin.firestore().collection('chatRooms').where('users', 'array-contains', uid).where('users', 'array-contains', data.userId).get();

  if (!chatRoom.empty) {
    chatRoom.forEach(async doc => {
      await doc.ref.update({ archived: true });
    });
  }


  if (likedUserLikedCurrentUser.data()?.likedUsersList.includes(uid)) {
    // create a chat room between the two users
    await admin.firestore().collection('chatRooms');
    // notify the liked user
    await pushNotification({
      userId: data.userId,
      notificationTitle: 'New Like',
      notificationContent: `${currUser} liked you`,
      notificationType: 'like'
    });
  }

  await pushNotification({
    userId: data.userId,
    notificationTitle: 'New Like',
    notificationContent: `${currUser} liked you`,
    notificationType: 'like'
  });
  
});
 


/**
 * Send a message to a user, in a certain chat room
 */
exports.sendMessage = onCall(async (request: CallableRequest<{ chatRoomId: string, message: string }>) => {
  // check if the chatroom exists
  const chatRoom = await admin.firestore().collection('chatRooms').doc(request.data.chatRoomId).get();
  if (!chatRoom.exists) {
    throw new HttpsError('not-found', 'Chat room not found');
  }

  const uid: string = request.auth?.uid!;

  // check if the user is part of the chat room
  if (!chatRoom.data()?.users.includes(uid)) {
    throw new HttpsError('permission-denied', 'You are not part of the chat room');
  }

  
});
