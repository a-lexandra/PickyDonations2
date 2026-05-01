import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


class ItemPage extends StatelessWidget{
  ItemPage({super.key, required this.item, required this.id});

  final Map<String, dynamic> item;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            children: [

                Row(
                  children: [
                  Image.network(item['photoURL'] ?? '', width: 150, height: 150, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),);
                  },),
                  //Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),
                  SizedBox(width: 50),

                  Column(
                    children: [
                      Text(item['productName'] ?? '', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                      // Text('Donated by: ' + (item['donatorName'] ?? ''), style: TextStyle(
                      //   color: Color.fromARGB(255, 19, 97, 29)
                      // ),)
                    ],
                  )
                  ],
                ),
                SizedBox(height: 50),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Category: ', style: TextStyle(
                            color: Color.fromARGB(255, 19, 97, 29),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Text(item['category'] ?? '', style: TextStyle(
                            color: Color.fromARGB(255, 19, 97, 29),
                          ),
                          textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      

                  SizedBox(height: 20),

                      Row(
                        children: [
                          Text('Status: ', style: TextStyle(
                            color: Color.fromARGB(255, 19, 97, 29),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Text(item['condition'] ?? '', style: TextStyle(
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),
                          textAlign: TextAlign.left,
                          ),
                        ],
                      ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text('Description: ', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                      ),
                      Text(item['description'] ?? '', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                      ),
                      textAlign: TextAlign.left,
                      ),
                    ],
                  ),

                  SizedBox(height: 60),

                    ],
                  ),
                ),

              if (item['is_posted'] == false)...[
                Row(
                  children: [         
                    IconButton(
                      onPressed: (){
                        FirebaseFirestore.instance.collection('donations').doc(id).update({'is_posted': true});
                      },
                      icon: Icon(Icons.check, color: Color.fromARGB(255, 3, 246, 80), size: 40,)
                    ),
                    SizedBox(width: 50,),
                    IconButton(
                      onPressed: (){
                        FirebaseFirestore.instance.collection('donations').doc(id).delete();
                      },
                      icon: Icon(Icons.close, color: Color.fromARGB(255, 246, 3, 27), size: 40,)
                    ),
                ],
                ),
              ],
         

            ],
          ),)
        ),

        ),
    );
  }

}