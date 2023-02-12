// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fist_wear/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAPnpL52r8laTFnPv-CJQQMFti2FpOF9_E',
          appId: '1:688787314144:android:f51a492c4ca85862958785',
          messagingSenderId: '688787314144',
          projectId: 'fistwear-69dd0'));

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
