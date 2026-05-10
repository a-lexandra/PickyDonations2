import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddVolunteer extends StatefulWidget{
  const AddVolunteer({super.key});

  @override
  State<AddVolunteer> createState() {
    return AddVolunteerState();
  }
}

class AddVolunteerState extends State<AddVolunteer>{
  final TextEditingController search = TextEditingController();
  String searchName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').where('account_type', isEqualTo: 'donor').snapshots(), 
          builder: (context, snapshot){
            if  (snapshot.hasError) {
              return Text("Error loading users");
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!.docs;
            final filtered = data.where((doc) {
              final user = doc.data();
              final username = user['username'].toString().toLowerCase();
              return username.contains(searchName);
            }).toList();

            return Center(
              child: Column(
                children: [
                  TextField(
                    controller: search,
                    onChanged: (value) {
                      setState(() {
                        searchName = value;
                      });
                    },
                    decoration: InputDecoration(
                      hint: Text('Search...', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontSize: 17,
                        ),),
                      icon: Icon(Icons.search, color: Color.fromARGB(255, 19, 97, 29),),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Expanded(child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index){
                      final userN = filtered[index].data();
                      final userId = filtered[index].id;
                      final adminId = FirebaseAuth.instance.currentUser!.uid;
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                            child: ListTile(
                              // leading: Image.network(
                              // user['photo'],
                              // errorBuilder: (context, error, stackTrace){
                              //   return const Icon(Icons.broken_image);
                              // },     
                              // ),
                              title: Text(userN['username'], style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),),
                              subtitle: Text(userN['email'], style: TextStyle(color: Color.fromARGB(255, 19, 97, 29))),
                            ),
                            ),
                            
                            IconButton(
                              onPressed: () async {
                                final adminD = await FirebaseFirestore.instance.collection('users').doc(adminId).get();
                                final groupId = adminD['groupID'];
                                await FirebaseFirestore.instance.collection('users').doc(userId).update({
                                  'account_type': 'volunteer',
                                  'groupID': groupId
                                });
                                //i se adauga o colectie in care i se vor adauga
                                //lucrurile pe care le a cerut
                                await FirebaseFirestore.instance.collection('groups').doc(groupId).collection('members').doc(userId).set({
                                  'joinedAt': FieldValue.serverTimestamp(),
                                });
                              }, 
                              icon: Icon(Icons.add, color: Color.fromARGB(255, 19, 97, 29),)
                            ),
                          
                        ],)
                      );
                    }
                  )),
                ],
              ),
            );
          }),
        
        ),
    );
  }
}