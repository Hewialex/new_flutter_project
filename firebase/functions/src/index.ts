/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import { CallableRequest, onCall } from "firebase-functions/v2/https";
import * as functions from "firebase-functions";
import * as logger from "firebase-functions/logger";
import * as admin from 'firebase-admin';   // admin sdk required to interact with the firebase services

// Start writing functions
// https://firebase.google.com/docs/functions/typescript


admin.initializeApp();
admin.firestore().settings({ ignoreUndefinedProperties: true });


// fired when a user account is deleted
export const userDeleted = functions.auth.user().onDelete((user) => {
  // delete user profile
  admin.firestore().collection('users').doc(user.uid).delete();

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
    throw new functions.https.HttpsError('unauthenticated', 'Email not verified yet, \
      please verify your email before proceeding to create a profile');
  }
  
  const data = request.data;
  
  // validate user data
  if (!data.gender || (data.gender !== 'male' && data.gender !== 'female')) {
    throw new functions.https.HttpsError('invalid-argument', `Invalid Gender, Choose \
      either male or female`);
  }

  // All common fields exist
  genderCommonUserFieldsList.forEach(field => {
    if (!data[field]) {
      throw new functions.https.HttpsError('invalid-argument', `Field ${field} is required`);
    }
  });

  // male should have the beard field
  if (data.gender === 'male' && data.beard === undefined) {
    throw new functions.https.HttpsError('invalid-argument', 'Field beard is required');
  }
  
  // female should have the veil field
  if (data.gender === 'female' && data.veil === undefined) {
    throw new functions.https.HttpsError('invalid-argument', 'Field veil is required');
  }

  // Create a new user profile
  const userProfile = await admin.firestore().collection('users').doc(uid).create(data);
  
  return {
    "message": "profile created successfully",
    ...userProfile
  };
});
