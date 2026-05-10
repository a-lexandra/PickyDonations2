import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/home_page.dart';
import 'package:donation_app/school_supplies.dart';
import 'package:donation_app/user_profile.dart';
import 'package:flutter/material.dart';

class AppBarS extends StatelessWidget implements PreferredSizeWidget {
  const AppBarS({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 193, 252, 189),
        elevation: 0,
        actions: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePage();
              }));
            }, 
            icon: Icon(Icons.home, color: Color.fromARGB(255, 19, 97, 29)),),
            
            SizedBox(width: 180),

            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserProfile(/*item: {
                    'username': FirebaseFirestore.instance.collection('users').doc(_userCredential.user!.uid).get('username');
                  },*/);
                }));
              }, 
              icon: Icon(Icons.menu, color: Color.fromARGB(255, 19, 97, 29))
            ),

            ],
        //   ),
        // ],
      ),
    );
  }
  
}
