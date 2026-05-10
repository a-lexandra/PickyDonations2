import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/item_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';



class Furniture extends StatefulWidget{
  const Furniture ({super.key});

  @override
  State<Furniture> createState() {
    return _FurnitureState();
  }
}

class _FurnitureState extends State<Furniture> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('donations').where('category', isEqualTo: 'Furniture').where('is_posted', isEqualTo: true).where('is_requested', isEqualTo: false).snapshots(), 
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

          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(), 
            builder: (context, snapshot){ 
              if (!snapshot.hasData || snapshot.data?.data() == null) {
                return const Center(child: CircularProgressIndicator());
              }
              final user = snapshot.data!.data() as Map<String, dynamic>;
              final userId = snapshot.data!.id;

          return ListView.builder(
            itemCount: totalItems.length,
            itemBuilder: (context, index) {
              final item = totalItems[index].data();
              final id = totalItems[index].id;
              return Card(
                color: Color.fromARGB(255, 137, 216, 131),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [

                Expanded(  
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
                ),

                if(user['account_type'] == 'volunteer')...[
                IconButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance.collection('donations').doc(id).update({
                      'is_requested': true,
                      'requested_by': userId
                    });
                  }, 
                  icon: Icon(Icons.add, color: Color.fromARGB(255, 19, 97, 29),)
                ),
              ],

                ],
                )

              );
            }
          );

          }
          );

        }
      ),)
    );
  }
}
