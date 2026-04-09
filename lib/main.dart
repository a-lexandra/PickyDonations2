import 'package:donation_app/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    MaterialApp(theme:ThemeData(useMaterial3: true),home:Scaffold(
      body:Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 193, 252, 189)
        ),

        child: StartScreen(),
      )
    ))
  );
}

