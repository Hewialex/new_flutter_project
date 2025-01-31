// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile Visits`
  String get profileVisits {
    return Intl.message(
      'Profile Visits',
      name: 'profileVisits',
      desc: '',
      args: [],
    );
  }

  /// `Favorite list`
  String get favoriteList {
    return Intl.message(
      'Favorite list',
      name: 'favoriteList',
      desc: '',
      args: [],
    );
  }

  /// `Who Favorited me?`
  String get whoFavoritedMe {
    return Intl.message(
      'Who Favorited me?',
      name: 'whoFavoritedMe',
      desc: '',
      args: [],
    );
  }

  /// `Ignore list`
  String get ignoreList {
    return Intl.message(
      'Ignore list',
      name: 'ignoreList',
      desc: '',
      args: [],
    );
  }

  /// `Photo Studio`
  String get photoStudio {
    return Intl.message(
      'Photo Studio',
      name: 'photoStudio',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get shareApp {
    return Intl.message(
      'Share App',
      name: 'shareApp',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Profile Settings`
  String get profileSettings {
    return Intl.message(
      'Profile Settings',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmationTitle {
    return Intl.message(
      'Confirmation',
      name: 'confirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Sign out?`
  String get signOutConfirmation {
    return Intl.message(
      'Are you sure you want to Sign out?',
      name: 'signOutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryButton {
    return Intl.message(
      'Retry',
      name: 'retryButton',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load user profile`
  String get unableToLoadProfile {
    return Intl.message(
      'Unable to load user profile',
      name: 'unableToLoadProfile',
      desc: '',
      args: [],
    );
  }

  /// `Unimplemented state`
  String get unimplementedState {
    return Intl.message(
      'Unimplemented state',
      name: 'unimplementedState',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emailRequired {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordRequired {
    return Intl.message(
      'Please enter your password',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled.`
  String get locationServicesDisabled {
    return Intl.message(
      'Location services are disabled.',
      name: 'locationServicesDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are denied`
  String get locationPermissionsDenied {
    return Intl.message(
      'Location permissions are denied',
      name: 'locationPermissionsDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied.`
  String get locationPermissionsPermanentlyDenied {
    return Intl.message(
      'Location permissions are permanently denied.',
      name: 'locationPermissionsPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Connection already established. Disconnecting the existing connection.`
  String get websocketConnectionExists {
    return Intl.message(
      'Connection already established. Disconnecting the existing connection.',
      name: 'websocketConnectionExists',
      desc: '',
      args: [],
    );
  }

  /// `No active connection to disconnect.`
  String get websocketNoConnection {
    return Intl.message(
      'No active connection to disconnect.',
      name: 'websocketNoConnection',
      desc: '',
      args: [],
    );
  }

  /// `Closing Websocket connection...`
  String get websocketClosing {
    return Intl.message(
      'Closing Websocket connection...',
      name: 'websocketClosing',
      desc: '',
      args: [],
    );
  }

  /// `Websocket connection closed.`
  String get websocketClosed {
    return Intl.message(
      'Websocket connection closed.',
      name: 'websocketClosed',
      desc: '',
      args: [],
    );
  }

  /// `Error processing WebSocket message: {error}`
  String websocketError(Object error) {
    return Intl.message(
      'Error processing WebSocket message: $error',
      name: 'websocketError',
      desc: '',
      args: [error],
    );
  }

  /// `About us`
  String get aboutUsTitle {
    return Intl.message(
      'About us',
      name: 'aboutUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.`
  String get aboutUsDescription1 {
    return Intl.message(
      'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.',
      name: 'aboutUsDescription1',
      desc: '',
      args: [],
    );
  }

  /// `lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.`
  String get aboutUsDescription2 {
    return Intl.message(
      'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.',
      name: 'aboutUsDescription2',
      desc: '',
      args: [],
    );
  }

  /// `lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.`
  String get aboutUsDescription3 {
    return Intl.message(
      'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.',
      name: 'aboutUsDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verifyEmail {
    return Intl.message(
      'Verify Email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Email`
  String get continueWithEmail {
    return Intl.message(
      'Continue with Email',
      name: 'continueWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get nameRequired {
    return Intl.message(
      'Please enter your name',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a username`
  String get usernameRequired {
    return Intl.message(
      'Please enter a username',
      name: 'usernameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get phoneRequired {
    return Intl.message(
      'Please enter your phone number',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalidPhone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain letters, numbers, and special characters`
  String get passwordRequirements {
    return Intl.message(
      'Password must contain letters, numbers, and special characters',
      name: 'passwordRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful`
  String get registrationSuccess {
    return Intl.message(
      'Registration successful',
      name: 'registrationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email has been sent`
  String get passwordResetEmailSent {
    return Intl.message(
      'Password reset email has been sent',
      name: 'passwordResetEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Verification email has been sent`
  String get emailVerificationSent {
    return Intl.message(
      'Verification email has been sent',
      name: 'emailVerificationSent',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalidCredentials {
    return Intl.message(
      'Invalid email or password',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `An account with this email already exists`
  String get accountExists {
    return Intl.message(
      'An account with this email already exists',
      name: 'accountExists',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak`
  String get weakPassword {
    return Intl.message(
      'Password is too weak',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Network connection error. Please try again`
  String get networkError {
    return Intl.message(
      'Network connection error. Please try again',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred`
  String get unknownError {
    return Intl.message(
      'An unknown error occurred',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to our {terms} and {privacy}`
  String agreeToTerms(Object terms, Object privacy) {
    return Intl.message(
      'By continuing, you agree to our $terms and $privacy',
      name: 'agreeToTerms',
      desc: '',
      args: [terms, privacy],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code sent to your email`
  String get enterVerificationCode {
    return Intl.message(
      'Enter the verification code sent to your email',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful`
  String get verificationSuccessful {
    return Intl.message(
      'Verification successful',
      name: 'verificationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get chatTitle {
    return Intl.message(
      'Messages',
      name: 'chatTitle',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet`
  String get noMessages {
    return Intl.message(
      'No messages yet',
      name: 'noMessages',
      desc: '',
      args: [],
    );
  }

  /// `Type a message...`
  String get typeMessage {
    return Intl.message(
      'Type a message...',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get reply {
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `Forward`
  String get forward {
    return Intl.message(
      'Forward',
      name: 'forward',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Message deleted`
  String get messageDeleted {
    return Intl.message(
      'Message deleted',
      name: 'messageDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Message Info`
  String get messageInfo {
    return Intl.message(
      'Message Info',
      name: 'messageInfo',
      desc: '',
      args: [],
    );
  }

  /// `Attach File`
  String get attachFile {
    return Intl.message(
      'Attach File',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message(
      'Document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message(
      'Offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `typing...`
  String get typing {
    return Intl.message(
      'typing...',
      name: 'typing',
      desc: '',
      args: [],
    );
  }

  /// `Last seen {time}`
  String lastSeen(Object time) {
    return Intl.message(
      'Last seen $time',
      name: 'lastSeen',
      desc: '',
      args: [time],
    );
  }

  /// `Block User`
  String get blockUser {
    return Intl.message(
      'Block User',
      name: 'blockUser',
      desc: '',
      args: [],
    );
  }

  /// `Unblock User`
  String get unblockUser {
    return Intl.message(
      'Unblock User',
      name: 'unblockUser',
      desc: '',
      args: [],
    );
  }

  /// `Report User`
  String get reportUser {
    return Intl.message(
      'Report User',
      name: 'reportUser',
      desc: '',
      args: [],
    );
  }

  /// `Clear Chat`
  String get clearChat {
    return Intl.message(
      'Clear Chat',
      name: 'clearChat',
      desc: '',
      args: [],
    );
  }

  /// `Delete Chat`
  String get deleteChat {
    return Intl.message(
      'Delete Chat',
      name: 'deleteChat',
      desc: '',
      args: [],
    );
  }

  /// `Message not sent`
  String get messageNotSent {
    return Intl.message(
      'Message not sent',
      name: 'messageNotSent',
      desc: '',
      args: [],
    );
  }

  /// `Tap to retry`
  String get retryMessage {
    return Intl.message(
      'Tap to retry',
      name: 'retryMessage',
      desc: '',
      args: [],
    );
  }

  /// `You can't send messages to this user`
  String get blockedMessage {
    return Intl.message(
      'You can\'t send messages to this user',
      name: 'blockedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Voice Message`
  String get voice {
    return Intl.message(
      'Voice Message',
      name: 'voice',
      desc: '',
      args: [],
    );
  }

  /// `Downloading...`
  String get downloading {
    return Intl.message(
      'Downloading...',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  /// `File is too large`
  String get fileTooBig {
    return Intl.message(
      'File is too large',
      name: 'fileTooBig',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUsTitle {
    return Intl.message(
      'Contact Us',
      name: 'contactUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `We'd love to hear from you. Send us a message and we'll respond as soon as possible.`
  String get contactUsDescription {
    return Intl.message(
      'We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
      name: 'contactUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get messageLabel {
    return Intl.message(
      'Message',
      name: 'messageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Type your message here...`
  String get messageHint {
    return Intl.message(
      'Type your message here...',
      name: 'messageHint',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get sendButton {
    return Intl.message(
      'Send Message',
      name: 'sendButton',
      desc: '',
      args: [],
    );
  }

  /// `Message sent successfully`
  String get messageSent {
    return Intl.message(
      'Message sent successfully',
      name: 'messageSent',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send message`
  String get messageFailed {
    return Intl.message(
      'Failed to send message',
      name: 'messageFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your message`
  String get messageEmpty {
    return Intl.message(
      'Please enter your message',
      name: 'messageEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Interact With Your`
  String get interactWithHappiness {
    return Intl.message(
      'Interact With Your',
      name: 'interactWithHappiness',
      desc: '',
      args: [],
    );
  }

  /// `Happiness!`
  String get happiness {
    return Intl.message(
      'Happiness!',
      name: 'happiness',
      desc: '',
      args: [],
    );
  }

  /// `Near You`
  String get nearYou {
    return Intl.message(
      'Near You',
      name: 'nearYou',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Unknown State`
  String get unknownState {
    return Intl.message(
      'Unknown State',
      name: 'unknownState',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message(
      'Members',
      name: 'members',
      desc: '',
      args: [],
    );
  }

  /// `New members`
  String get newMembers {
    return Intl.message(
      'New members',
      name: 'newMembers',
      desc: '',
      args: [],
    );
  }

  /// `Online members`
  String get onlineMembers {
    return Intl.message(
      'Online members',
      name: 'onlineMembers',
      desc: '',
      args: [],
    );
  }

  /// `Premium members`
  String get premiumMembers {
    return Intl.message(
      'Premium members',
      name: 'premiumMembers',
      desc: '',
      args: [],
    );
  }

  /// `Auto searcher`
  String get autoSearcher {
    return Intl.message(
      'Auto searcher',
      name: 'autoSearcher',
      desc: '',
      args: [],
    );
  }

  /// `Member Profile`
  String get memberProfile {
    return Intl.message(
      'Member Profile',
      name: 'memberProfile',
      desc: '',
      args: [],
    );
  }

  /// `Delete from favorite list`
  String get deleteFromFavorites {
    return Intl.message(
      'Delete from favorite list',
      name: 'deleteFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Delete from ignore list`
  String get deleteFromIgnoreList {
    return Intl.message(
      'Delete from ignore list',
      name: 'deleteFromIgnoreList',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{1 member} other{{count} members}}`
  String memberCount(num count) {
    return Intl.plural(
      count,
      one: '1 member',
      other: '$count members',
      name: 'memberCount',
      desc: '',
      args: [count],
    );
  }

  /// `Edit your profile`
  String get editYourProfile {
    return Intl.message(
      'Edit your profile',
      name: 'editYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `General Tips: `
  String get generalTips {
    return Intl.message(
      'General Tips: ',
      name: 'generalTips',
      desc: '',
      args: [],
    );
  }

  /// `Qismati team wishes you success`
  String get qismatiTeamWishes {
    return Intl.message(
      'Qismati team wishes you success',
      name: 'qismatiTeamWishes',
      desc: '',
      args: [],
    );
  }

  /// `Tell us about yourself and your ideal partner. Please be truthful and objective when describing yourself and the person you're seeking. Leaving this field blank may limit your chance of finding a suitable match, so be sure to provide detailed and accurate information`
  String get profileDescription {
    return Intl.message(
      'Tell us about yourself and your ideal partner. Please be truthful and objective when describing yourself and the person you\'re seeking. Leaving this field blank may limit your chance of finding a suitable match, so be sure to provide detailed and accurate information',
      name: 'profileDescription',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showMore {
    return Intl.message(
      'Show More',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Professional Details`
  String get professionalDetails {
    return Intl.message(
      'Professional Details',
      name: 'professionalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get additionalInformation {
    return Intl.message(
      'Additional Information',
      name: 'additionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Marriage Type`
  String get marriageType {
    return Intl.message(
      'Marriage Type',
      name: 'marriageType',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get maritalStatus {
    return Intl.message(
      'Marital Status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Children`
  String get children {
    return Intl.message(
      'Children',
      name: 'children',
      desc: '',
      args: [],
    );
  }

  /// `Height (cm)`
  String get height {
    return Intl.message(
      'Height (cm)',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get weight {
    return Intl.message(
      'Weight (kg)',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Skin Color`
  String get skinColor {
    return Intl.message(
      'Skin Color',
      name: 'skinColor',
      desc: '',
      args: [],
    );
  }

  /// `Body Shape`
  String get bodyShape {
    return Intl.message(
      'Body Shape',
      name: 'bodyShape',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Educational Qualification`
  String get educationalQualification {
    return Intl.message(
      'Educational Qualification',
      name: 'educationalQualification',
      desc: '',
      args: [],
    );
  }

  /// `Financial Status`
  String get financialStatus {
    return Intl.message(
      'Financial Status',
      name: 'financialStatus',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Income`
  String get monthlyIncome {
    return Intl.message(
      'Monthly Income',
      name: 'monthlyIncome',
      desc: '',
      args: [],
    );
  }

  /// `Health Case`
  String get healthCase {
    return Intl.message(
      'Health Case',
      name: 'healthCase',
      desc: '',
      args: [],
    );
  }

  /// `Religious Commitment`
  String get religiousCommitment {
    return Intl.message(
      'Religious Commitment',
      name: 'religiousCommitment',
      desc: '',
      args: [],
    );
  }

  /// `Veil`
  String get veil {
    return Intl.message(
      'Veil',
      name: 'veil',
      desc: '',
      args: [],
    );
  }

  /// `Beard`
  String get beard {
    return Intl.message(
      'Beard',
      name: 'beard',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `No nearby users found`
  String get noNearbyUsers {
    return Intl.message(
      'No nearby users found',
      name: 'noNearbyUsers',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get goToHome {
    return Intl.message(
      'Back to Login',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get ignore {
    return Intl.message(
      'Ignore',
      name: 'ignore',
      desc: '',
      args: [],
    );
  }

  /// `Other Options`
  String get otherOptions {
    return Intl.message(
      'Other Options',
      name: 'otherOptions',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clearAll {
    return Intl.message(
      'Clear All',
      name: 'clearAll',
      desc: '',
      args: [],
    );
  }

  /// `Error loading notifications`
  String get errorLoadingNotifications {
    return Intl.message(
      'Error loading notifications',
      name: 'errorLoadingNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Find your partner with us`
  String get findPartner {
    return Intl.message(
      'Find your partner with us',
      name: 'findPartner',
      desc: '',
      args: [],
    );
  }

  /// `Marriage is a great relationship`
  String get marriageRelationship {
    return Intl.message(
      'Marriage is a great relationship',
      name: 'marriageRelationship',
      desc: '',
      args: [],
    );
  }

  /// `Find your perfect life partner`
  String get perfectLifePartner {
    return Intl.message(
      'Find your perfect life partner',
      name: 'perfectLifePartner',
      desc: '',
      args: [],
    );
  }

  /// `Discover your soulmate with ease and confidence`
  String get discoverSoulmate {
    return Intl.message(
      'Discover your soulmate with ease and confidence',
      name: 'discoverSoulmate',
      desc: '',
      args: [],
    );
  }

  /// `The foundation of love, trust, and lifelong companionship`
  String get foundationOfLove {
    return Intl.message(
      'The foundation of love, trust, and lifelong companionship',
      name: 'foundationOfLove',
      desc: '',
      args: [],
    );
  }

  /// `Guided by faith, united for a lifetime in blessings`
  String get guidedByFaith {
    return Intl.message(
      'Guided by faith, united for a lifetime in blessings',
      name: 'guidedByFaith',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `The terms and conditions of the App`
  String get termsAndConditionsApp {
    return Intl.message(
      'The terms and conditions of the App',
      name: 'termsAndConditionsApp',
      desc: '',
      args: [],
    );
  }

  /// `I'm Female`
  String get iAmFemale {
    return Intl.message(
      'I\'m Female',
      name: 'iAmFemale',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_action {
    return Intl.message(
      'Continue',
      name: 'continue_action',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message(
      'Features',
      name: 'features',
      desc: '',
      args: [],
    );
  }

  /// `Receive message.`
  String get receiveMessage {
    return Intl.message(
      'Receive message.',
      name: 'receiveMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send message to any member.`
  String get sendMessageToAny {
    return Intl.message(
      'Send message to any member.',
      name: 'sendMessageToAny',
      desc: '',
      args: [],
    );
  }

  /// `Send message to member from your country.`
  String get sendMessageToCountry {
    return Intl.message(
      'Send message to member from your country.',
      name: 'sendMessageToCountry',
      desc: '',
      args: [],
    );
  }

  /// `Message who added you to his favorite list.`
  String get messageWhoFavorited {
    return Intl.message(
      'Message who added you to his favorite list.',
      name: 'messageWhoFavorited',
      desc: '',
      args: [],
    );
  }

  /// `Reply to message.`
  String get replyToMessage {
    return Intl.message(
      'Reply to message.',
      name: 'replyToMessage',
      desc: '',
      args: [],
    );
  }

  /// `Control who can message you.`
  String get controlMessaging {
    return Intl.message(
      'Control who can message you.',
      name: 'controlMessaging',
      desc: '',
      args: [],
    );
  }

  /// `Remove ads.`
  String get removeAds {
    return Intl.message(
      'Remove ads.',
      name: 'removeAds',
      desc: '',
      args: [],
    );
  }

  /// `By subscribing to the premium package, you will activate all the available features and thus increase your efficiency in the application to reach your goal faster.`
  String get premiumDescription {
    return Intl.message(
      'By subscribing to the premium package, you will activate all the available features and thus increase your efficiency in the application to reach your goal faster.',
      name: 'premiumDescription',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe Now`
  String get subscribeNow {
    return Intl.message(
      'Subscribe Now',
      name: 'subscribeNow',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get viewProfile {
    return Intl.message(
      'View Profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Share Profile`
  String get shareProfile {
    return Intl.message(
      'Share Profile',
      name: 'shareProfile',
      desc: '',
      args: [],
    );
  }

  /// `Report Profile`
  String get reportProfile {
    return Intl.message(
      'Report Profile',
      name: 'reportProfile',
      desc: '',
      args: [],
    );
  }

  /// `Block Profile`
  String get blockProfile {
    return Intl.message(
      'Block Profile',
      name: 'blockProfile',
      desc: '',
      args: [],
    );
  }

  /// `Unblock Profile`
  String get unblockProfile {
    return Intl.message(
      'Unblock Profile',
      name: 'unblockProfile',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get contactInformation {
    return Intl.message(
      'Contact Information',
      name: 'contactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Location Information`
  String get locationInformation {
    return Intl.message(
      'Location Information',
      name: 'locationInformation',
      desc: '',
      args: [],
    );
  }

  /// `Preference Information`
  String get preferenceInformation {
    return Intl.message(
      'Preference Information',
      name: 'preferenceInformation',
      desc: '',
      args: [],
    );
  }

  /// `Last Active`
  String get lastActive {
    return Intl.message(
      'Last Active',
      name: 'lastActive',
      desc: '',
      args: [],
    );
  }

  /// `Member Since`
  String get memberSince {
    return Intl.message(
      'Member Since',
      name: 'memberSince',
      desc: '',
      args: [],
    );
  }

  /// `Profile Views`
  String get profileViews {
    return Intl.message(
      'Profile Views',
      name: 'profileViews',
      desc: '',
      args: [],
    );
  }

  /// `Profile Likes`
  String get profileLikes {
    return Intl.message(
      'Profile Likes',
      name: 'profileLikes',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutMe {
    return Intl.message(
      'About Me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Looking For`
  String get lookingFor {
    return Intl.message(
      'Looking For',
      name: 'lookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Hobbies`
  String get hobbies {
    return Intl.message(
      'Hobbies',
      name: 'hobbies',
      desc: '',
      args: [],
    );
  }

  /// `Upload Photo`
  String get uploadPhoto {
    return Intl.message(
      'Upload Photo',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Remove Photo`
  String get removePhoto {
    return Intl.message(
      'Remove Photo',
      name: 'removePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Make Profile Photo`
  String get makeProfilePhoto {
    return Intl.message(
      'Make Profile Photo',
      name: 'makeProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Not Specified`
  String get notSpecified {
    return Intl.message(
      'Not Specified',
      name: 'notSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchScreenTitle {
    return Intl.message(
      'Search',
      name: 'searchScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Search`
  String get advancedSearch {
    return Intl.message(
      'Advanced Search',
      name: 'advancedSearch',
      desc: '',
      args: [],
    );
  }

  /// `Quick Search`
  String get quickSearch {
    return Intl.message(
      'Quick Search',
      name: 'quickSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search by Username`
  String get searchByUsername {
    return Intl.message(
      'Search by Username',
      name: 'searchByUsername',
      desc: '',
      args: [],
    );
  }

  /// `Account information`
  String get account_information {
    return Intl.message(
      'Account information',
      name: 'account_information',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get verify_email {
    return Intl.message(
      'Verify your email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Your ID`
  String get your_id {
    return Intl.message(
      'Your ID',
      name: 'your_id',
      desc: '',
      args: [],
    );
  }

  /// `970239`
  String get id_value {
    return Intl.message(
      '970239',
      name: 'id_value',
      desc: '',
      args: [],
    );
  }

  /// `Using Qismati`
  String get using_qismati {
    return Intl.message(
      'Using Qismati',
      name: 'using_qismati',
      desc: '',
      args: [],
    );
  }

  /// `3 months`
  String get usage_duration {
    return Intl.message(
      '3 months',
      name: 'usage_duration',
      desc: '',
      args: [],
    );
  }

  /// `Your connect status`
  String get your_connect_status {
    return Intl.message(
      'Your connect status',
      name: 'your_connect_status',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get connect_status {
    return Intl.message(
      'Connected',
      name: 'connect_status',
      desc: '',
      args: [],
    );
  }

  /// `You can control who sends you messages`
  String get control_messages {
    return Intl.message(
      'You can control who sends you messages',
      name: 'control_messages',
      desc: '',
      args: [],
    );
  }

  /// `Settings Page`
  String get settings_page {
    return Intl.message(
      'Settings Page',
      name: 'settings_page',
      desc: '',
      args: [],
    );
  }

  /// `To see all features assigned to you in the app`
  String get see_all_features {
    return Intl.message(
      'To see all features assigned to you in the app',
      name: 'see_all_features',
      desc: '',
      args: [],
    );
  }

  /// `Click here`
  String get click_here {
    return Intl.message(
      'Click here',
      name: 'click_here',
      desc: '',
      args: [],
    );
  }

  /// `My Settings`
  String get my_settings {
    return Intl.message(
      'My Settings',
      name: 'my_settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Who can message you?`
  String get who_can_message_you {
    return Intl.message(
      'Who can message you?',
      name: 'who_can_message_you',
      desc: '',
      args: [],
    );
  }

  /// `Countries`
  String get countries {
    return Intl.message(
      'Countries',
      name: 'countries',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get notification_settings {
    return Intl.message(
      'Notification Settings',
      name: 'notification_settings',
      desc: '',
      args: [],
    );
  }

  /// `Who added me to their favorite list?`
  String get who_added_to_favorite {
    return Intl.message(
      'Who added me to their favorite list?',
      name: 'who_added_to_favorite',
      desc: '',
      args: [],
    );
  }

  /// `My Profile Visits`
  String get my_profile_visits {
    return Intl.message(
      'My Profile Visits',
      name: 'my_profile_visits',
      desc: '',
      args: [],
    );
  }

  /// `Who added me to the ignore list?`
  String get who_added_to_ignore {
    return Intl.message(
      'Who added me to the ignore list?',
      name: 'who_added_to_ignore',
      desc: '',
      args: [],
    );
  }

  /// `New Messages`
  String get new_messages {
    return Intl.message(
      'New Messages',
      name: 'new_messages',
      desc: '',
      args: [],
    );
  }

  /// `Who allowed me to see their photos?`
  String get who_allowed_see_photos {
    return Intl.message(
      'Who allowed me to see their photos?',
      name: 'who_allowed_see_photos',
      desc: '',
      args: [],
    );
  }

  /// `Success Stories`
  String get success_stories {
    return Intl.message(
      'Success Stories',
      name: 'success_stories',
      desc: '',
      args: [],
    );
  }

  /// `Ringtone Alert`
  String get ringtone_alert {
    return Intl.message(
      'Ringtone Alert',
      name: 'ringtone_alert',
      desc: '',
      args: [],
    );
  }

  /// `Vibrate Alert`
  String get vibrate_alert {
    return Intl.message(
      'Vibrate Alert',
      name: 'vibrate_alert',
      desc: '',
      args: [],
    );
  }

  /// `Notify me when the app is off`
  String get notify_when_app_off {
    return Intl.message(
      'Notify me when the app is off',
      name: 'notify_when_app_off',
      desc: '',
      args: [],
    );
  }

  /// `Receive notification on e-mail`
  String get receive_email_notifications {
    return Intl.message(
      'Receive notification on e-mail',
      name: 'receive_email_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Font Settings`
  String get font_settings {
    return Intl.message(
      'Font Settings',
      name: 'font_settings',
      desc: '',
      args: [],
    );
  }

  /// `Increase font-size`
  String get increase_font_size {
    return Intl.message(
      'Increase font-size',
      name: 'increase_font_size',
      desc: '',
      args: [],
    );
  }

  /// `Signup successful`
  String get signup_successful {
    return Intl.message(
      'Signup successful',
      name: 'signup_successful',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `App Terms`
  String get app_terms {
    return Intl.message(
      'App Terms',
      name: 'app_terms',
      desc: '',
      args: [],
    );
  }

  /// `By clicking on sign up button, you agree to`
  String get terms_conditions_text {
    return Intl.message(
      'By clicking on sign up button, you agree to',
      name: 'terms_conditions_text',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Unimplemented state`
  String get unimplemented_state {
    return Intl.message(
      'Unimplemented state',
      name: 'unimplemented_state',
      desc: '',
      args: [],
    );
  }

  /// `Signed up user successfully`
  String get signed_up_user_successfully {
    return Intl.message(
      'Signed up user successfully',
      name: 'signed_up_user_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Could not signup user`
  String get could_not_signup_user {
    return Intl.message(
      'Could not signup user',
      name: 'could_not_signup_user',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Create an account so you can explore all App`
  String get create_account_description {
    return Intl.message(
      'Create an account so you can explore all App',
      name: 'create_account_description',
      desc: '',
      args: [],
    );
  }

  /// `About Your Partner`
  String get about_your_partner {
    return Intl.message(
      'About Your Partner',
      name: 'about_your_partner',
      desc: '',
      args: [],
    );
  }

  /// `To provide an accurate answer, please do not enter an email or phone number.`
  String get about_your_partner_info {
    return Intl.message(
      'To provide an accurate answer, please do not enter an email or phone number.',
      name: 'about_your_partner_info',
      desc: '',
      args: [],
    );
  }

  /// `Education and Work`
  String get education_and_work {
    return Intl.message(
      'Education and Work',
      name: 'education_and_work',
      desc: '',
      args: [],
    );
  }

  /// `Educational Qualification`
  String get education_qualification {
    return Intl.message(
      'Educational Qualification',
      name: 'education_qualification',
      desc: '',
      args: [],
    );
  }

  /// `Financial Status`
  String get financial_status {
    return Intl.message(
      'Financial Status',
      name: 'financial_status',
      desc: '',
      args: [],
    );
  }

  /// `Job Category`
  String get job_category {
    return Intl.message(
      'Job Category',
      name: 'job_category',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Income`
  String get monthly_income {
    return Intl.message(
      'Monthly Income',
      name: 'monthly_income',
      desc: '',
      args: [],
    );
  }

  /// `Health Status`
  String get health_case {
    return Intl.message(
      'Health Status',
      name: 'health_case',
      desc: '',
      args: [],
    );
  }

  /// `Your Appearance`
  String get your_look {
    return Intl.message(
      'Your Appearance',
      name: 'your_look',
      desc: '',
      args: [],
    );
  }

  /// `Skin Color`
  String get skin_color {
    return Intl.message(
      'Skin Color',
      name: 'skin_color',
      desc: '',
      args: [],
    );
  }

  /// `Body Shape`
  String get body_shape {
    return Intl.message(
      'Body Shape',
      name: 'body_shape',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get marital_status {
    return Intl.message(
      'Marital Status',
      name: 'marital_status',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Type of Marriage`
  String get marriage_type {
    return Intl.message(
      'Type of Marriage',
      name: 'marriage_type',
      desc: '',
      args: [],
    );
  }

  /// `Religion`
  String get religion {
    return Intl.message(
      'Religion',
      name: 'religion',
      desc: '',
      args: [],
    );
  }

  /// `Religious Commitment`
  String get religion_commitment {
    return Intl.message(
      'Religious Commitment',
      name: 'religion_commitment',
      desc: '',
      args: [],
    );
  }

  /// `Prayer`
  String get prayer {
    return Intl.message(
      'Prayer',
      name: 'prayer',
      desc: '',
      args: [],
    );
  }

  /// `Smoking`
  String get smoking {
    return Intl.message(
      'Smoking',
      name: 'smoking',
      desc: '',
      args: [],
    );
  }

  /// `Talk About Yourself`
  String get talk_about_yourself {
    return Intl.message(
      'Talk About Yourself',
      name: 'talk_about_yourself',
      desc: '',
      args: [],
    );
  }

  /// `This information will only be used to respond to you and will not be publicly shared.`
  String get talk_about_yourself_info {
    return Intl.message(
      'This information will only be used to respond to you and will not be publicly shared.',
      name: 'talk_about_yourself_info',
      desc: '',
      args: [],
    );
  }

  /// `The username must contain 15 characters and not exceed this limit.`
  String get username_info {
    return Intl.message(
      'The username must contain 15 characters and not exceed this limit.',
      name: 'username_info',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain at least 6 characters.`
  String get password_info {
    return Intl.message(
      'The password must contain at least 6 characters.',
      name: 'password_info',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account?`
  String get account_exist {
    return Intl.message(
      'Do you have an account?',
      name: 'account_exist',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `The code has been sent to your email.`
  String get code_sent {
    return Intl.message(
      'The code has been sent to your email.',
      name: 'code_sent',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enter_code {
    return Intl.message(
      'Enter Code',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `Sporty`
  String get sporty {
    return Intl.message(
      'Sporty',
      name: 'sporty',
      desc: '',
      args: [],
    );
  }

  /// `Slim`
  String get slim {
    return Intl.message(
      'Slim',
      name: 'slim',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Overweight`
  String get overweight {
    return Intl.message(
      'Overweight',
      name: 'overweight',
      desc: '',
      args: [],
    );
  }

  /// `Bulky`
  String get bulky {
    return Intl.message(
      'Bulky',
      name: 'bulky',
      desc: '',
      args: [],
    );
  }

  /// `Built`
  String get built {
    return Intl.message(
      'Built',
      name: 'built',
      desc: '',
      args: [],
    );
  }

  /// `White`
  String get white {
    return Intl.message(
      'White',
      name: 'white',
      desc: '',
      args: [],
    );
  }

  /// `Wheatish`
  String get wheatish {
    return Intl.message(
      'Wheatish',
      name: 'wheatish',
      desc: '',
      args: [],
    );
  }

  /// `Whitish`
  String get whitish {
    return Intl.message(
      'Whitish',
      name: 'whitish',
      desc: '',
      args: [],
    );
  }

  /// `Light Brown`
  String get light_brown {
    return Intl.message(
      'Light Brown',
      name: 'light_brown',
      desc: '',
      args: [],
    );
  }

  /// `Dark Brown`
  String get to_brown {
    return Intl.message(
      'Dark Brown',
      name: 'to_brown',
      desc: '',
      args: [],
    );
  }

  /// `Moderate Brown`
  String get moderate_brown {
    return Intl.message(
      'Moderate Brown',
      name: 'moderate_brown',
      desc: '',
      args: [],
    );
  }

  /// `Dark Brown`
  String get dark_brown {
    return Intl.message(
      'Dark Brown',
      name: 'dark_brown',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Prays punctually`
  String get prays_punctually {
    return Intl.message(
      'Prays punctually',
      name: 'prays_punctually',
      desc: '',
      args: [],
    );
  }

  /// `Prays most of the time`
  String get prays_most_of_the_time {
    return Intl.message(
      'Prays most of the time',
      name: 'prays_most_of_the_time',
      desc: '',
      args: [],
    );
  }

  /// `Usually prays`
  String get prays_usually {
    return Intl.message(
      'Usually prays',
      name: 'prays_usually',
      desc: '',
      args: [],
    );
  }

  /// `I do not pray`
  String get i_do_not_pray {
    return Intl.message(
      'I do not pray',
      name: 'i_do_not_pray',
      desc: '',
      args: [],
    );
  }

  /// `Prefer not to say`
  String get prefer_not_to_say {
    return Intl.message(
      'Prefer not to say',
      name: 'prefer_not_to_say',
      desc: '',
      args: [],
    );
  }

  /// `Not religious`
  String get not_religious {
    return Intl.message(
      'Not religious',
      name: 'not_religious',
      desc: '',
      args: [],
    );
  }

  /// `A little religious`
  String get little_religious {
    return Intl.message(
      'A little religious',
      name: 'little_religious',
      desc: '',
      args: [],
    );
  }

  /// `Religious`
  String get religious {
    return Intl.message(
      'Religious',
      name: 'religious',
      desc: '',
      args: [],
    );
  }

  /// `Very religious`
  String get very_religious {
    return Intl.message(
      'Very religious',
      name: 'very_religious',
      desc: '',
      args: [],
    );
  }

  /// `Unemployed`
  String get unemployed {
    return Intl.message(
      'Unemployed',
      name: 'unemployed',
      desc: '',
      args: [],
    );
  }

  /// `Less than 200 dollars`
  String get less_than_200_dollars {
    return Intl.message(
      'Less than 200 dollars',
      name: 'less_than_200_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 200 and 500 dollars`
  String get between_200_and_500_dollars {
    return Intl.message(
      'Between 200 and 500 dollars',
      name: 'between_200_and_500_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 500 and 800 dollars`
  String get between_500_and_800_dollars {
    return Intl.message(
      'Between 500 and 800 dollars',
      name: 'between_500_and_800_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 800 and 1200 dollars`
  String get between_800_and_1200_dollars {
    return Intl.message(
      'Between 800 and 1200 dollars',
      name: 'between_800_and_1200_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 1200 and 1800 dollars`
  String get between_1200_and_1800_dollars {
    return Intl.message(
      'Between 1200 and 1800 dollars',
      name: 'between_1200_and_1800_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 1800 and 2500 dollars`
  String get between_1800_and_2500_dollars {
    return Intl.message(
      'Between 1800 and 2500 dollars',
      name: 'between_1800_and_2500_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 2500 and 3500 dollars`
  String get between_2500_and_3500_dollars {
    return Intl.message(
      'Between 2500 and 3500 dollars',
      name: 'between_2500_and_3500_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 3500 and 5000 dollars`
  String get between_3500_and_5000_dollars {
    return Intl.message(
      'Between 3500 and 5000 dollars',
      name: 'between_3500_and_5000_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 5000 and 7000 dollars`
  String get between_5000_and_7000_dollars {
    return Intl.message(
      'Between 5000 and 7000 dollars',
      name: 'between_5000_and_7000_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 7000 and 10000 dollars`
  String get between_7000_and_10000_dollars {
    return Intl.message(
      'Between 7000 and 10000 dollars',
      name: 'between_7000_and_10000_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 10000 and 13000 dollars`
  String get between_10000_and_13000_dollars {
    return Intl.message(
      'Between 10000 and 13000 dollars',
      name: 'between_10000_and_13000_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Between 13000 and 15000 dollars`
  String get between_13000_and_15000_dollars {
    return Intl.message(
      'Between 13000 and 15000 dollars',
      name: 'between_13000_and_15000_dollars',
      desc: '',
      args: [],
    );
  }

  /// `More than 15000 dollars`
  String get more_than_15000_dollars {
    return Intl.message(
      'More than 15000 dollars',
      name: 'more_than_15000_dollars',
      desc: '',
      args: [],
    );
  }

  /// `Healthy`
  String get healthy {
    return Intl.message(
      'Healthy',
      name: 'healthy',
      desc: '',
      args: [],
    );
  }

  /// `Motor Disability`
  String get motor_disability {
    return Intl.message(
      'Motor Disability',
      name: 'motor_disability',
      desc: '',
      args: [],
    );
  }

  /// `Amputation`
  String get amputation {
    return Intl.message(
      'Amputation',
      name: 'amputation',
      desc: '',
      args: [],
    );
  }

  /// `Bending Disability`
  String get bending_disability {
    return Intl.message(
      'Bending Disability',
      name: 'bending_disability',
      desc: '',
      args: [],
    );
  }

  /// `Hearing Disability`
  String get hearing_disability {
    return Intl.message(
      'Hearing Disability',
      name: 'hearing_disability',
      desc: '',
      args: [],
    );
  }

  /// `Visual Disability`
  String get visual_disability {
    return Intl.message(
      'Visual Disability',
      name: 'visual_disability',
      desc: '',
      args: [],
    );
  }

  /// `Leprosy`
  String get leprosy {
    return Intl.message(
      'Leprosy',
      name: 'leprosy',
      desc: '',
      args: [],
    );
  }

  /// `Skin Diseases`
  String get skin_diseases {
    return Intl.message(
      'Skin Diseases',
      name: 'skin_diseases',
      desc: '',
      args: [],
    );
  }

  /// `Distorted Burns`
  String get distorted_burns {
    return Intl.message(
      'Distorted Burns',
      name: 'distorted_burns',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes`
  String get diabetes {
    return Intl.message(
      'Diabetes',
      name: 'diabetes',
      desc: '',
      args: [],
    );
  }

  /// `Impaired Hearing`
  String get impaired_hearing {
    return Intl.message(
      'Impaired Hearing',
      name: 'impaired_hearing',
      desc: '',
      args: [],
    );
  }

  /// `Speech Impairment`
  String get speech_impairment {
    return Intl.message(
      'Speech Impairment',
      name: 'speech_impairment',
      desc: '',
      args: [],
    );
  }

  /// `Excessive Obesity`
  String get excessive_obesity {
    return Intl.message(
      'Excessive Obesity',
      name: 'excessive_obesity',
      desc: '',
      args: [],
    );
  }

  /// `Infantile Paralysis`
  String get infantile_paralysis {
    return Intl.message(
      'Infantile Paralysis',
      name: 'infantile_paralysis',
      desc: '',
      args: [],
    );
  }

  /// `Quadriplegia`
  String get quadriplegia {
    return Intl.message(
      'Quadriplegia',
      name: 'quadriplegia',
      desc: '',
      args: [],
    );
  }

  /// `Hemiplegia`
  String get hemiplegia {
    return Intl.message(
      'Hemiplegia',
      name: 'hemiplegia',
      desc: '',
      args: [],
    );
  }

  /// `Impotence`
  String get impotence {
    return Intl.message(
      'Impotence',
      name: 'impotence',
      desc: '',
      args: [],
    );
  }

  /// `Sterility`
  String get sterility {
    return Intl.message(
      'Sterility',
      name: 'sterility',
      desc: '',
      args: [],
    );
  }

  /// `Loss of a Limb`
  String get loss_of_a_limb {
    return Intl.message(
      'Loss of a Limb',
      name: 'loss_of_a_limb',
      desc: '',
      args: [],
    );
  }

  /// `Pygmy`
  String get pygmy {
    return Intl.message(
      'Pygmy',
      name: 'pygmy',
      desc: '',
      args: [],
    );
  }

  /// `Down's Syndrome`
  String get downs_syndrome {
    return Intl.message(
      'Down\'s Syndrome',
      name: 'downs_syndrome',
      desc: '',
      args: [],
    );
  }

  /// `Psychiatric Disability`
  String get psychiatric_disability {
    return Intl.message(
      'Psychiatric Disability',
      name: 'psychiatric_disability',
      desc: '',
      args: [],
    );
  }

  /// `Middle School/Junior High`
  String get middle_school_junior_high {
    return Intl.message(
      'Middle School/Junior High',
      name: 'middle_school_junior_high',
      desc: '',
      args: [],
    );
  }

  /// `High School`
  String get high_school {
    return Intl.message(
      'High School',
      name: 'high_school',
      desc: '',
      args: [],
    );
  }

  /// `Graduate/Postgraduate`
  String get graduate_postgraduate {
    return Intl.message(
      'Graduate/Postgraduate',
      name: 'graduate_postgraduate',
      desc: '',
      args: [],
    );
  }

  /// `Doctorate`
  String get doctorate {
    return Intl.message(
      'Doctorate',
      name: 'doctorate',
      desc: '',
      args: [],
    );
  }

  /// `Self-Taught`
  String get self_taught {
    return Intl.message(
      'Self-Taught',
      name: 'self_taught',
      desc: '',
      args: [],
    );
  }

  /// `Administration`
  String get administration {
    return Intl.message(
      'Administration',
      name: 'administration',
      desc: '',
      args: [],
    );
  }

  /// `Another Thing`
  String get another_thing {
    return Intl.message(
      'Another Thing',
      name: 'another_thing',
      desc: '',
      args: [],
    );
  }

  /// `Art / Literature`
  String get art_literary {
    return Intl.message(
      'Art / Literature',
      name: 'art_literary',
      desc: '',
      args: [],
    );
  }

  /// `Computer / Informatics`
  String get computer_informatics {
    return Intl.message(
      'Computer / Informatics',
      name: 'computer_informatics',
      desc: '',
      args: [],
    );
  }

  /// `Construction`
  String get construction {
    return Intl.message(
      'Construction',
      name: 'construction',
      desc: '',
      args: [],
    );
  }

  /// `Food Services`
  String get food_services {
    return Intl.message(
      'Food Services',
      name: 'food_services',
      desc: '',
      args: [],
    );
  }

  /// `I am still a student`
  String get i_am_still_a_student {
    return Intl.message(
      'I am still a student',
      name: 'i_am_still_a_student',
      desc: '',
      args: [],
    );
  }

  /// `Law`
  String get law {
    return Intl.message(
      'Law',
      name: 'law',
      desc: '',
      args: [],
    );
  }

  /// `Medical Field`
  String get medical_field {
    return Intl.message(
      'Medical Field',
      name: 'medical_field',
      desc: '',
      args: [],
    );
  }

  /// `Politics / Government`
  String get politics_government {
    return Intl.message(
      'Politics / Government',
      name: 'politics_government',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get private {
    return Intl.message(
      'Private',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `Retired`
  String get retired {
    return Intl.message(
      'Retired',
      name: 'retired',
      desc: '',
      args: [],
    );
  }

  /// `Sales and Marketing`
  String get sales_and_marketing {
    return Intl.message(
      'Sales and Marketing',
      name: 'sales_and_marketing',
      desc: '',
      args: [],
    );
  }

  /// `Secretarial`
  String get secretarial {
    return Intl.message(
      'Secretarial',
      name: 'secretarial',
      desc: '',
      args: [],
    );
  }

  /// `Teaching`
  String get teaching {
    return Intl.message(
      'Teaching',
      name: 'teaching',
      desc: '',
      args: [],
    );
  }

  /// `Technical / Science / Engineering`
  String get technical_science_engineering {
    return Intl.message(
      'Technical / Science / Engineering',
      name: 'technical_science_engineering',
      desc: '',
      args: [],
    );
  }

  /// `Trade`
  String get trade {
    return Intl.message(
      'Trade',
      name: 'trade',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get transport {
    return Intl.message(
      'Transport',
      name: 'transport',
      desc: '',
      args: [],
    );
  }

  /// `Without Employment`
  String get without_employment {
    return Intl.message(
      'Without Employment',
      name: 'without_employment',
      desc: '',
      args: [],
    );
  }

  /// `Self-Sufficient`
  String get self_sufficient {
    return Intl.message(
      'Self-Sufficient',
      name: 'self_sufficient',
      desc: '',
      args: [],
    );
  }

  /// `Moderate`
  String get moderate {
    return Intl.message(
      'Moderate',
      name: 'moderate',
      desc: '',
      args: [],
    );
  }

  /// `Saving`
  String get saving {
    return Intl.message(
      'Saving',
      name: 'saving',
      desc: '',
      args: [],
    );
  }

  /// `Spending`
  String get spending {
    return Intl.message(
      'Spending',
      name: 'spending',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get single {
    return Intl.message(
      'Single',
      name: 'single',
      desc: '',
      args: [],
    );
  }

  /// `Divorced`
  String get divorced {
    return Intl.message(
      'Divorced',
      name: 'divorced',
      desc: '',
      args: [],
    );
  }

  /// `Widowed`
  String get widowed {
    return Intl.message(
      'Widowed',
      name: 'widowed',
      desc: '',
      args: [],
    );
  }

  /// `Only one wife`
  String get only_one_wife {
    return Intl.message(
      'Only one wife',
      name: 'only_one_wife',
      desc: '',
      args: [],
    );
  }

  /// `Accepts Polygamy`
  String get accept_polygamy {
    return Intl.message(
      'Accepts Polygamy',
      name: 'accept_polygamy',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Assalamu alaikum wa rahmatullahi`
  String get assalamuAlaikum {
    return Intl.message(
      'Assalamu alaikum wa rahmatullahi',
      name: 'assalamuAlaikum',
      desc: '',
      args: [],
    );
  }

  /// `To allow all member the opportunity to register for Qismiati, it is free of charge.`
  String get freeOfCharge {
    return Intl.message(
      'To allow all member the opportunity to register for Qismiati, it is free of charge.',
      name: 'freeOfCharge',
      desc: '',
      args: [],
    );
  }

  /// `Please take an oath before registering`
  String get takeOath {
    return Intl.message(
      'Please take an oath before registering',
      name: 'takeOath',
      desc: '',
      args: [],
    );
  }

  /// `I swear by ALLAH Almighty that I will not enter this App except for the purpose of legal marriage, and not for any other purpose. I promise ALLAH and I promise you that I will not waste the hard work of the App, and that I will not deceive the members, and that I will be honest with ALLAH and then with myself, and that I will abide by.`
  String get oathText {
    return Intl.message(
      'I swear by ALLAH Almighty that I will not enter this App except for the purpose of legal marriage, and not for any other purpose. I promise ALLAH and I promise you that I will not waste the hard work of the App, and that I will not deceive the members, and that I will be honest with ALLAH and then with myself, and that I will abide by.',
      name: 'oathText',
      desc: '',
      args: [],
    );
  }

  /// `ALLAH is the best witness`
  String get allahWitness {
    return Intl.message(
      'ALLAH is the best witness',
      name: 'allahWitness',
      desc: '',
      args: [],
    );
  }

  /// `I've taken an oath`
  String get takenOath {
    return Intl.message(
      'I\'ve taken an oath',
      name: 'takenOath',
      desc: '',
      args: [],
    );
  }

  /// `I'm Male`
  String get iAmMale {
    return Intl.message(
      'I\'m Male',
      name: 'iAmMale',
      desc: '',
      args: [],
    );
  }

  /// `Write a message...`
  String get write_a_message {
    return Intl.message(
      'Write a message...',
      name: 'write_a_message',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `Warning: to avoid any act of scam we ask you sincerely to not send money or respond to aid requests.`
  String get warning {
    return Intl.message(
      'Warning: to avoid any act of scam we ask you sincerely to not send money or respond to aid requests.',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `To report an offensive message, tap and hold the message and select the Report the message option`
  String get report_offensive_message {
    return Intl.message(
      'To report an offensive message, tap and hold the message and select the Report the message option',
      name: 'report_offensive_message',
      desc: '',
      args: [],
    );
  }

  /// `You can manage your privacy and chat permissions through your account settings`
  String get manage_privacy {
    return Intl.message(
      'You can manage your privacy and chat permissions through your account settings',
      name: 'manage_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `as`
  String get as {
    return Intl.message(
      'as',
      name: 'as',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'am'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'om'),
      Locale.fromSubtags(languageCode: 'so'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
