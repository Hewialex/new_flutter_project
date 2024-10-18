import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qismati/firebase_options.dart';
import 'package:qismati/qismati_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // use firebase emulator_suite when app is in debug mode
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5003);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);

    } catch (e) {
      print('Error connecting to the emulator: $e');
    }
  }

  runApp(const QismatiApp());
}
