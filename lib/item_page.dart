import 'package:donation_app/home_page.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget{
  ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),

              ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 85, 169, 87),
              ),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context){
                      return HomePage();
                    }));
                }, 
                child: Text('back', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),)
                ),

                SizedBox(height: 75),

                Row(
                  children: [
                  //  Image(image: )
                  SizedBox(width: 50),

                  Column(
                    children: [
                      Text('(product name)', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),),
                      Text('Donated by' + '(name)', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),)
                    ],
                  )
                  ],
                ),
                SizedBox(height: 100),

                Text('Category: ' + '(category)', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29),
                ),
                textAlign: TextAlign.left,
                ),

                SizedBox(height: 20),

                Text('Status: ' + '(status)', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),),

                SizedBox(height: 20),

                Text('Description: ' + '(description)', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),),

                SizedBox(height: 60),

                Text('From the same category:', style: TextStyle(
                  color: Color.fromARGB(255, 19, 97, 29)
                ),)
            ],
          ),
        ),

        ),
    );
  }

}