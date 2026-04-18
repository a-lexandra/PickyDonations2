import 'package:donation_app/app_bar.dart';
import 'package:donation_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


class ItemPage extends StatelessWidget{
  ItemPage({super.key, required this.item});

  final Map<String, dynamic> item;

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

              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: ElevatedButton(style: ElevatedButton.styleFrom(
              //   backgroundColor: Color.fromARGB(255, 85, 169, 87),
              //   alignment: Alignment.centerLeft
              // ),
              //   onPressed: (){
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(builder: (context){
              //         return HomePage();
              //       }));
              //   }, 
              //   child: Text('back', style: TextStyle(
              //     color: Color.fromARGB(255, 19, 97, 29)
              //   ),),
              //   ),
              // ),

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

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('From the same category:', style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),),
                ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
              
                SingleChildScrollView(
                  child: Row(            
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.image_outlined, size: 60, color: Color.fromARGB(255, 19, 97, 29),),
                    SizedBox(width: 30),
                    Icon(Icons.image_outlined, size: 60, color: Color.fromARGB(255, 19, 97, 29),),
                    SizedBox(width: 30),
                    Icon(Icons.image_outlined, size: 60, color: Color.fromARGB(255, 19, 97, 29),),
                    SizedBox(width: 30),
                  ],
                ),
                )
                
                
            ],
          ),)
        ),

        ),
    );
  }

}