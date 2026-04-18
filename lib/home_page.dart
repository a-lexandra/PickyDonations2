import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/item_page.dart';
import 'package:donation_app/school_supplies.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';



class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('donations').snapshots(), 
        builder: (context, itemSnapshots){
          if(itemSnapshots.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator());
          }

          if(!itemSnapshots.hasData || itemSnapshots.data!.docs.isEmpty){
            return const Center(
              child: Text('No new donations'));
          }

          if(itemSnapshots.hasError){
            return const Center(
              child: Text('An error appeared'));
          }


          final totalItems = itemSnapshots.data!.docs;

          return ListView.builder(
            itemCount: totalItems.length,
            itemBuilder: (context, index) {
              final item = totalItems[index].data();
              return Card(
                color: Color.fromARGB(255, 137, 216, 131),
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    item['photoURL'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 60);
                    },
                  ),
                  title: Text(item['productName'] ?? 'No name', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29), fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category: ${item['category'] ?? 'N/A'}', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),),
                      Text('Condition: ${item['condition'] ?? 'N/A'}', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemPage(item: item)),
                    );
                  },
                ),
              );
            }
          );
        }
      ),)
    );
  }






    // return Scaffold(
    //   backgroundColor: Color.fromARGB(255, 193, 252, 189),
    // appBar: AppBarS(),
    // body: Padding(
    //   padding: EdgeInsets.all(20),
    // child: Center(
    //   child: Column(
    //     children: [
          
    //       Row(
    //         children: [
              
    //           Text('Search', style: TextStyle(
    //             fontSize: 20,
    //             color: Color.fromARGB(255, 19, 97, 29)
    //           ),),

    //           SizedBox(width: 150),

    //           Text('Filter', style: TextStyle(
    //             fontSize: 20,
    //             color: Color.fromARGB(255, 19, 97, 29)
    //           ))
    //         ], 
    //       ),

    //       SizedBox(height: 20),
    //     Row(
    //       children: [
    //         IconButton(
    //           onPressed: (){
    //             Navigator.push(
    //               context, 
    //               MaterialPageRoute(builder: (context){
    //                 return ItemPage();
    //               }));
    //           }, 
    //           icon: Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),),
           
    //         SizedBox(width: 50),

    //         Column(
    //           children: [
    //             Text('category', style: TextStyle(
    //               color: Color.fromARGB(255, 19, 97, 29)
    //             ),),
    //             Text('status', style: TextStyle(
    //               color: Color.fromARGB(255, 19, 97, 29)
    //             ),)
    //           ],
    //         )
    //       ],
    //     ),

    //     SizedBox(height: 20),

    //     Row(
    //       children: [
    //         IconButton(
    //           onPressed: (){
    //             Navigator.push(
    //               context, 
    //               MaterialPageRoute(builder: (context){
    //                 return ItemPage();
    //               }));
    //           }, 
    //           icon: Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),),
           
    //         SizedBox(width: 50),

    //         Column(
    //           children: [
    //             Text('category', style: TextStyle(
    //               color: Color.fromARGB(255, 19, 97, 29)
    //             ),),
    //             Text('status', style: TextStyle(
    //               color: Color.fromARGB(255, 19, 97, 29)
    //             ),)
    //           ],
    //         )
    //       ],
    //     ),

    //     SizedBox(height: 20),
    //     Row(
    //       children: [
    //         IconButton(
    //           onPressed: (){
    //             Navigator.push(
    //               context, 
    //               MaterialPageRoute(builder: (context){
    //                 return ItemPage();
    //               }));
    //           }, 
    //           icon: Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),),
           
    //         SizedBox(width: 50),

    //         Column(
    //           children: [
    //             Text('category', style: TextStyle(
    //               color: Color.fromARGB(255, 19, 97, 29)
    //             ),),
    //             Text('status', style: TextStyle(
    //               color: Color.fromARGB(255, 19, 97, 29)
    //             ),)
    //           ],
    //         )
    //       ],
    //     ),

        // Row(
        //   children: [
        //     IconButton(
        //       onPressed: (){},
        //       //taken sau selected photo file 
        //       icon: Image.file(...))
        //   ],
        // )

        // ElevatedButton(
        //   onPressed: (){
        //     Navigator.push(
        //       context, 
        //       MaterialPageRoute(builder: (context){
        //         return ItemPage();
        //       }));
        //   }, 
        //   child: Text('item'))

    //     ],
    //   ),
    // ) )
    // );
  }
