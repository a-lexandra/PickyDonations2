import 'package:donation_app/home_page.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget{
  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189) ,

      body: Padding(
        padding: EdgeInsets.all(20.0),
      child: Center(

      child: Column(
        children: [

          SizedBox(height: 80),

          Text("Log in", style: TextStyle(
            color: Color.fromARGB(255, 19, 97, 29),
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,
          ),

          SizedBox(height: 80),

          TextField(decoration: InputDecoration(
            label: Text('email', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29),
            ),),
          ),),

          SizedBox(height: 30),

          TextField(decoration: InputDecoration(
            label: Text('password', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),),
          ),),

          SizedBox(height: 80),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 85, 169, 87)
            ),
          onPressed:(){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context){
                return HomePage();
              }));
          },
          child: Text('Submit', style: TextStyle(
            color: Color.fromARGB(255, 19, 97, 29)
          ),))
        ],
      ),
        ))
    );
  }
}