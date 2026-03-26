import 'package:donation_app/item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
    
    body: Padding(
      padding: EdgeInsets.all(20),
    child: Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          
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

        //  Image(image: image)

        ElevatedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context){
                return ItemPage();
              }));
          }, 
          child: Text('item'))

        ],
      ),
    ) )
    );
  }
}