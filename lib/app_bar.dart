import 'package:donation_app/home_page.dart';
import 'package:donation_app/user_profile.dart';
import 'package:flutter/material.dart';

class AppBarS extends StatelessWidget implements PreferredSizeWidget {
  const AppBarS({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 193, 252, 189),
        elevation: 0,
        actions: [
          
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePage();
              }));
            }, 
            icon: Icon(Icons.home),),
            
            SizedBox(width: 180),

            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserProfile();
                }));
              }, 
              icon: Icon(Icons.menu))
        ],
      ),
    );
  }
  
}
