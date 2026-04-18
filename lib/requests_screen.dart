import 'package:donation_app/app_bar.dart';
import 'package:donation_app/home_page.dart';
import 'package:donation_app/user_profile.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget{
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() {
    return RequestsScreenState();
  }
}

class RequestsScreenState extends State<RequestsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context){
                        return UserProfile();
                      }));
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 85, 169, 87)
                  ),
                  child: Text('Back', style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}