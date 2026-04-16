import 'package:donation_app/add_item.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/vgroup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarS(),
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle, size: 80, color: Color.fromARGB(255, 19, 97, 29),),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('username', style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),),
                      Text('Account type', style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),)
                    ],
                  )
                ],
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text('Institute:', style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 19, 97, 29)
                    ),
                    textAlign: TextAlign.start,
                    ),

                    SizedBox(height: 5),

                    Text('Items donated:', style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 19, 97, 29)
                    ),
                    textAlign: TextAlign.left,
                    ),

                    SizedBox(height: 20),

                  TextButton.icon(
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddItem();
                    }));
                    }, 
                    icon: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 19, 97, 29),),
                    label: Text('Donate item', style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)),

                TextButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return Vgroup();
                    }));
                  }, 
                  icon: Icon(Icons.group, color: Color.fromARGB(255, 19, 97, 29),),
                  label: Text('See group', style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)),

                TextButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 19, 97, 29),),
                  label: Text('Add volunteers to\n the group +', style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)),

                TextButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.waving_hand, color: Color.fromARGB(255, 19, 97, 29),),
                  label: Text('see requests', style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)),
              

                IconButton(
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                  }, 
                  icon: Icon(Icons.logout))
                  ],
                ),
              ),

              SizedBox(height: 40),
              
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Item requested', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),),
                        Text('category x nr', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),)
                      ],
                    ),

                    SizedBox(width: 50),

                    Column(
                      children: [
                        Text('request status', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),),

                        Text('status', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29)
                         ),)
                      ],
                    )
                  ],
                ),

            ],
          ),
        ),)
    );
  }
}