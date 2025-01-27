import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qismati/qismati_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Make the status bar transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set to transparent
    statusBarIconBrightness:
        Brightness.dark, // Change to dark icons for light background
  ));
  runApp(const QismatiApp());
}
