import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/add_volunteer.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Vgroup extends StatefulWidget{
  const Vgroup({super.key});

  @override
  State<Vgroup> createState() {
    return VgroupState();
  }
}

class VgroupState extends State<Vgroup>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
          final uinfo = snapshot.data!.data() as Map<String, dynamic>;
          print("uinfo = $uinfo");
          print("groupID = ${uinfo['groupID']}");
          print("institute = ${uinfo['institute']}");
          print("account_type = ${uinfo['account_type']}");

          final groupID = uinfo['groupID'];

        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Align(
                //alignment: Alignment.centerLeft,
                //Column(
                  //children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(uinfo['institute'], style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),),

                        SizedBox(width: 100),

                      if(uinfo['account_type'] == 'admin')...[
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return AddVolunteer();
                            }));
                          }, 
                          icon: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 19, 97, 29),)
                        )
                      ],


                      ],
                    ),
                    
                    SizedBox(height: 25),

                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('groups').doc(groupID).collection('members').snapshots(), 
                      builder: (context, ginfo){
                        if(!ginfo.hasData){
                          return const Center(child: CircularProgressIndicator(),);
                        }

                        //final data = ginfo.data!.data() as Map<String, dynamic>;
                        //final memberIDs = List<String>.from(data['members'] ?? []);
                        final memberD = ginfo.data!.docs;

                        if(memberD.isEmpty){
                          return const Center(child: Text('No volunteers added', style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),),);
                        }

                        // final memberIDs = memberD.map((doc){
                        //   doc.id;
                        // }).toList();

                      //  final memberIDs = memberD.map((doc) => doc.id).where((id) => id != null && id.trim().isNotEmpty).toList();
                        final memberIDs = memberD.map((doc) => doc.id).toList();


                    return FutureBuilder(
                      future: FirebaseFirestore.instance.collection('users').where(FieldPath.documentId, whereIn: memberIDs.take(10).toList()).get(), 
                      builder: (context, usnapshot){
                        if(!usnapshot.hasData){
                          return Center(child: CircularProgressIndicator(),);
                        }

                        final users = usnapshot.data!.docs;

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index){
                        final user = users[index].data();
                        final userId = users[index].id;
                        final adminId = FirebaseAuth.instance.currentUser!.uid;
                        return Card(
                          color: Color.fromARGB(255, 137, 216, 131),
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(user['username'], style: TextStyle(color: Color.fromARGB(255, 19, 97, 29))),
                                ),
                              ),

                            if(uinfo['account_type'] == 'admin')...[
                              IconButton(
                                onPressed: () async {
                                  final adminD = await FirebaseFirestore.instance.collection('users').doc(adminId).get();
                                  final groupId = adminD['groupID'];
                                  await FirebaseFirestore.instance.collection('users').doc(userId).update({
                                    'account_type': 'donor',
                                    'groupID': null,
                                  });
                                  await FirebaseFirestore.instance.collection('groups').doc(groupId).collection('members').doc(userId).delete();
                                }, 
                                icon: Icon(Icons.remove, color: Color.fromARGB(255, 19, 97, 29),)
                              ),
                            ]

                            ],
                          ),
                          
                        );
                         
                      }
                    );

                    });

                    }),
                  ),



                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    //       Text('name', style: TextStyle(
                    //         fontSize: 20,
                    //         color: Color.fromARGB(255, 19, 97, 29)
                    //       ),),

                    //       SizedBox(height: 5),

                    //       Text('name', style: TextStyle(
                    //         fontSize: 20,
                    //         color: Color.fromARGB(255, 19, 97, 29)
                    //       ),),

                    //       SizedBox(height: 5),

                    //       Text('name', style: TextStyle(
                    //         fontSize: 20,
                    //         color: Color.fromARGB(255, 19, 97, 29)
                    //       ),),

                    //       SizedBox(height: 5),

                    //       Text('name', style: TextStyle(
                    //         fontSize: 20,
                    //         color: Color.fromARGB(255, 19, 97, 29)
                    //       ),),
                    //     ],
                    //   ),
                    // )
                  ],
                //),
              //)
              
              
            //],
          ),
        );
        
      
      //});
  }),
      
    ));
  }
}