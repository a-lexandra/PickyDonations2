import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarS(),
      //backgroundColor: Color.fromARGB(255, 193, 252, 189),
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.all(20),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(), 
        builder: (context, userInfo){
        if(userInfo.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
      var _isUser, _isAdmin, _isVolunteer;
      
      return Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
              onPressed: (){}, 
              icon: Icon(Icons.account_circle, size: 50, color: Color.fromARGB(255, 19, 97, 29),),
              label: Text('Change profile picture', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)))
            ),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
              onPressed: (){
                // TextFormField(decoration: InputDecoration(
                //   label: Text('enter new username', style: TextStyle(
                //     color: Color.fromARGB(255, 19, 97, 29)
                //   ),)
                // ),
                // );
                
              }, 
              icon: Icon(Icons.edit, size: 40, color: Color.fromARGB(255, 19, 97, 29),),
              label: Text('Change username', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)))
            ),
            ),
            
            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
              onPressed: (){}, 
              icon: Icon(Icons.email, size: 40, color: Color.fromARGB(255, 19, 97, 29),),
              label: Text('Change password', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)))
            )),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: (){}, 
                label: Text('Ask for admin account', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),),
                icon: Icon(Icons.compare_arrows_outlined, size: 40, color: Color.fromARGB(255, 19, 97, 29),),
              ),
            ),

            SizedBox(height: 20,),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const App()),
                    (route) => false,
                  );
              }, 
              icon: Icon(Icons.logout, size: 40, color: Color.fromARGB(255, 19, 97, 29),),
              label: Text('Logout', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)))
            )),

            SizedBox(height: 50),

            Row(
              children: [
                SizedBox(width: 15),
                TextButton(
                  onPressed: (){
                    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                      'account_type': 'donor'
                    });
                  },
                  child: Text('donor', style: TextStyle(fontSize: 17),)
                ),
                SizedBox(width: 20),
                TextButton(
                  onPressed: (){
                    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                      'account_type': 'volunteer'
                    });
                  }, 
                  child: Text('volunteer', style: TextStyle(fontSize: 17),)
                ),
                SizedBox(width: 20),
                TextButton(
                  onPressed: (){
                    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                      'account_type': 'admin'
                    });
                  }, 
                  child: Text('admin', style: TextStyle(fontSize: 17),)
                ),
              ],
            )
            
          ],)
      );
      })
      ),
    
    );
  }
}