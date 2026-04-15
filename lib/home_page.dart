import 'package:donation_app/app_bar.dart';
import 'package:donation_app/item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
    appBar: AppBarS(),
    body: Padding(
      padding: EdgeInsets.all(20),
    child: Center(
      child: Column(
        children: [
          
          Row(
            children: [
              
              Text('Search', style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 19, 97, 29)
              ),),

              SizedBox(width: 150),

              Text('Filter', style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 19, 97, 29)
              ))
            ], 
          ),

          SizedBox(height: 20),

        Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context){
                    return ItemPage();
                  }));
              }, 
              icon: Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),),
           
            SizedBox(width: 50),

            Column(
              children: [
                Text('category', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),),
                Text('status', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),)
              ],
            )
          ],
        ),

        SizedBox(height: 20),

        Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context){
                    return ItemPage();
                  }));
              }, 
              icon: Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),),
           
            SizedBox(width: 50),

            Column(
              children: [
                Text('category', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),),
                Text('status', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),)
              ],
            )
          ],
        ),

        SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context){
                    return ItemPage();
                  }));
              }, 
              icon: Icon(Icons.image_outlined, size: 80, color: Color.fromARGB(255, 19, 97, 29),),),
           
            SizedBox(width: 50),

            Column(
              children: [
                Text('category', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),),
                Text('status', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),)
              ],
            )
          ],
        ),

        // ElevatedButton(
        //   onPressed: (){
        //     Navigator.push(
        //       context, 
        //       MaterialPageRoute(builder: (context){
        //         return ItemPage();
        //       }));
        //   }, 
        //   child: Text('item'))

        ],
      ),
    ) )
    );
  }
}