import 'package:donation_app/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
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

