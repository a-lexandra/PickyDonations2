import 'package:donation_app/add_item.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/requests_screen.dart';
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
                  ),

                  SizedBox(width: 70),

                  IconButton(
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                  }, 
                  icon: Icon(Icons.logout, color: Color.fromARGB(255, 19, 97, 29),))
                ],
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Institute:', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 19, 97, 29)),
                      ),
                    ),
                    
                    SizedBox(height: 7),

                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text('Items donated:', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 19, 97, 29)),
                      ),
                    ),
                    
                    SizedBox(height: 30),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AddItem();
                          }));
                        }, 
                        icon: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 19, 97, 29), size: 17,),
                        label: Text('Donate item', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29),
                          fontSize: 17),
                      )),
                    ),

                    SizedBox(height: 3),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return Vgroup(); 
                          }));
                        }, 
                      icon: Icon(Icons.group, color: Color.fromARGB(255, 19, 97, 29), size: 17,),
                      label: Text('See group', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontSize: 17),
                      )),
                    ),

                    SizedBox(height: 3),

                // TextButton.icon(
                //   onPressed: (){}, 
                //   icon: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 19, 97, 29),),
                //   label: Text('Add volunteers to\n the group +', style: TextStyle(
                //     color: Color.fromARGB(255, 19, 97, 29)
                //   ),)),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return RequestsScreen();
                          }));
                        }, 
                      icon: Icon(Icons.waving_hand, color: Color.fromARGB(255, 19, 97, 29), size: 17,),
                      label: Text('See requests', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29), 
                        fontSize: 17),
                      )),
                    )
            
                  ],
                ),
              ),

              SizedBox(height: 70),
              
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Item requested', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),
                        Text('category x nr', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29),
                          fontSize: 15,
                        ),)
                      ],
                    ),

                    SizedBox(width: 70),

                    Column(
                      children: [
                        Text('Request status', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),

                        Text('status', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29),
                          fontSize: 15,
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