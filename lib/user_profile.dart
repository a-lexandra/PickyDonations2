import 'package:donation_app/add_item.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/requests_screen.dart';
import 'package:donation_app/settings.dart';
import 'package:donation_app/vgroup.dart';
import 'package:donation_app/vrequested.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile>{
  bool _isUser = false, _isAdmin = false, _isVolunteer = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarS(),
      //backgroundColor: Color.fromARGB(255, 193, 252, 189),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(), 
          builder: (context, snapshot){
            if (snapshot.hasData && snapshot.data!.exists) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              if(data['account_type'] == 'donor'){
                //setState(() {
                _isUser = true;
                _isAdmin = false;
                _isVolunteer = false;
                //});
              }
              if(data['account_type'] == 'volunteer'){
                //setState(() {
                _isUser = false;
                _isAdmin = false;
                _isVolunteer = true;
                //});
              }
              if(data['account_type'] == 'admin'){
                //setState(() {
                _isUser = false;
                _isAdmin = true;
                _isVolunteer = false;
                //});
              }

              final uID = FirebaseAuth.instance.currentUser!.uid;

            String totalDonations = data['donations_nr'].toString();
        
        return Center(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: [
                  Icon(Icons.account_circle, size: 80, color: Color.fromARGB(255, 19, 97, 29),),
                  
                  SizedBox(width: 10),
                    
                  Column(
                        children: [
                          Text(data['username'], style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Text(data['account_type'], style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),)
                        ],
                      ),
                    

                  SizedBox(width: 70),

                  IconButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return SettingsPage();
                      }));
                    }, 
                    icon: Icon(Icons.settings, color: Color.fromARGB(255, 19, 97, 29),)
                    ),
                ],
                ),
              ),
              

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Column(
                      children: [                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Institute: ${data['institute']}', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 19, 97, 29)),
                      ),
                    ),
                    
                    SizedBox(height: 7),

                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text('Items donated: $totalDonations', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 19, 97, 29)),
                      ),
                    ),

                      SizedBox(height: 30),

                    if (_isUser || _isVolunteer) ...[
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
                    ],

                      ],
                    ),
                  

                    SizedBox(height: 3),
                  
                  if(_isAdmin || _isVolunteer) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return Vgroup(); 
                          }));
                        }, 
                      icon: Icon(Icons.group, color: Color.fromARGB(255, 19, 97, 29), size: 17,),
                      label: Text('See volunteer group', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontSize: 17),
                      )),
                    ),
                  ],

                    SizedBox(height: 3),

                  if(_isAdmin) ...[
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
            
                  ],
                ),
              ),

              SizedBox(height: 3),
              
              if(_isVolunteer) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Vrequested(id: uID);
                      }));
                    },
                    icon: Icon(Icons.request_quote_outlined, color: Color.fromARGB(255, 19, 97, 29), size: 17,), 
                    label: Text('See requested items', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29),
                      fontSize: 17
                    )),)
                ),
                




                // Row(
                //   children: [
                //     Column(
                //       children: [
                //         Text('Item requested', style: TextStyle(
                //           color: Color.fromARGB(255, 19, 97, 29),
                //           fontWeight: FontWeight.bold,
                //           fontSize: 17,
                //         ),),
                //         Text('category x nr', style: TextStyle(
                //           color: Color.fromARGB(255, 19, 97, 29),
                //           fontSize: 15,
                //         ),)
                //       ],
                //     ),

                //     SizedBox(width: 70),

                //     Column(
                //       children: [
                //         Text('Request status', style: TextStyle(
                //           color: Color.fromARGB(255, 19, 97, 29),
                //           fontWeight: FontWeight.bold,
                //           fontSize: 17,
                //         ),),

                //         Text('status', style: TextStyle(
                //           color: Color.fromARGB(255, 19, 97, 29),
                //           fontSize: 15,
                //          ),)
                //       ],
                //     )
                //   ],
                // ),
              ],

            ],
          ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
        )
    );
  }
}