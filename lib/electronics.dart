import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/item_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';



class Electronics extends StatefulWidget{
  const Electronics ({super.key});

  @override
  State<Electronics> createState() {
    return _ElectronicsState();
  }
}

class _ElectronicsState extends State<Electronics> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('donations').where('category', isEqualTo: 'Electronics').where('is_posted', isEqualTo: true).snapshots(), 
        builder: (context, itemSnapshots){
          if(itemSnapshots.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator());
          }

          if(!itemSnapshots.hasData || itemSnapshots.data!.docs.isEmpty){
            return const Center(
              child: Text('No new donations', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29), fontSize: 20)));
          }

          if(itemSnapshots.hasError){
            return const Center(
              child: Text('An error appeared', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29), fontSize: 20)));
          }


          final totalItems = itemSnapshots.data!.docs;

          return ListView.builder(
            itemCount: totalItems.length,
            itemBuilder: (context, index) {
              final item = totalItems[index].data();
              final id = totalItems[index].id;
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
                      MaterialPageRoute(builder: (context) => ItemPage(item: item, id: id)),
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
}
