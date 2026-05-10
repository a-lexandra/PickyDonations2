import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:flutter/material.dart';

class Vrequested extends StatefulWidget{
  const Vrequested ({super.key, required this.id});

  final String id;

  @override
  State<Vrequested> createState() {
    return _VrequestedState();
  }
}

class _VrequestedState extends State<Vrequested>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('donations').where('is_requested', isEqualTo: true).where('requested_by', isEqualTo: widget.id).snapshots(), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return const Center(
              child: Text('No requested items', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29), fontSize: 20)),
            );
          }

          final totalItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: totalItems.length,
            itemBuilder: (context, index){
              final item = totalItems[index].data();
              final itemId = totalItems[index].id;
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
                      ),
                    ),

                    IconButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance.collection('donations').doc(itemId).update({
                          'is_requested': false,
                          'requested_by': null
                        });
                      }, 
                      icon: Icon(Icons.remove, color: Color.fromARGB(255, 19, 97, 29),)
                    ),

                  ],
                ),
              );
            }
          );
        }
      ),
      ),
    );
  }
}