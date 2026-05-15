import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 193, 252, 189),
      backgroundColor: Colors.white,
    body: Padding(padding: EdgeInsets.all(20),
    child: Center(
      child: Text('Loading', style: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 19, 97, 29)
      ),),
    ),),
    );
  }
}