import 'package:donation_app/create_account.dart';
import 'package:donation_app/home_page.dart';
import 'package:donation_app/log_in.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 160),
          Text('Welcome to PickyDonations!', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color:  const Color.fromARGB(255, 19, 97, 29),
            
          ),
          textAlign: TextAlign.center,
          ),

          SizedBox(height: 120),

          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 85, 169, 87)
          ),  
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return CreateAccount();
              })
            );
          },
          child: Text('create account', style: TextStyle(
            color: const Color.fromARGB(255, 19, 97, 29)
          ),)),

          SizedBox(height: 30),

          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 85, 169, 87)
          ),  
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return LogIn();
              })
            );
          },
          child: Text('log in', style: TextStyle(
            color: const Color.fromARGB(255, 19, 97, 29)
          ),)),

          SizedBox(height: 80),

          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
            }, 
            child: Text('home page'))
        ],
      ),
    );
  }
}