import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/home_page.dart';
import 'package:donation_app/item_page.dart';
import 'package:donation_app/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget{
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() {
    return RequestsScreenState();
  }
}

class RequestsScreenState extends State<RequestsScreen> with TickerProviderStateMixin{
  late final TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:StreamBuilder(
          stream: FirebaseFirestore.instance.collection('donations').where('is_posted', isEqualTo: false).snapshots(), 
          builder: (context, snapshot){  
            final totalItems = snapshot.data!.docs;

        return Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  //volunteer tab
                  Column(
                    children: [
                      Text('Volunteer requests', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                    ],
                  ),

                  //user post tab
                  Column(
                    children: [
                      Text('Donor post requests', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                      SizedBox(height: 30,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: totalItems.length,
                        itemBuilder: (context, index){
                          final item = totalItems[index].data();
                          final id = totalItems[index].id;
                          return Card(
                            color: Color.fromARGB(255, 137, 216, 131),
                            margin: const EdgeInsets.only(bottom: 15),
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
                        },
                      ),
                    ),
                    ]
                  ),
                ],
              ),
            );
            
          
          
        
        }),
      ),

      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Volunteer'),
          Tab(text: 'Donors')
        ],
        labelColor: Color.fromARGB(255, 19, 97, 29),    
        unselectedLabelColor: Color.fromARGB(255, 137, 216, 131),
        indicatorPadding: EdgeInsets.all(5),
        indicatorColor: Color.fromARGB(255, 19, 97, 29),
        indicatorWeight: 1,
        padding: EdgeInsets.all(20),
        dividerColor: Color.fromARGB(255, 193, 252, 189),
        textScaler: TextScaler.linear(1.3),
      ),
    );
  }
}