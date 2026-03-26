import 'package:donation_app/home_page.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget{
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState(){
    return CreateAccountState();
  }
}


class CreateAccountState extends State<CreateAccount>{

  //bool isChecked = false;

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

          Text('Create account', style: TextStyle(
            color: Color.fromARGB(255, 19, 97, 29),
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),),

          SizedBox(height: 50),

          TextField(decoration: InputDecoration(
            label: Text('username', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),)
          ),),

          SizedBox(height: 30),

          TextField(decoration: InputDecoration(
            label: Text('email', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),)
          ),),

          SizedBox(height: 30),

          TextField(decoration: InputDecoration(
            label: Text('password', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),)
          ),),

          SizedBox(height: 30),

          Row(
            children: [
              Text('Account type:', style: TextStyle(
                color: Color.fromARGB(255, 19, 97, 29)
              )),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(value: isChecked, onChanged: (value){}),
                      Text('admin', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),),
                    ]
                  ),

                  Row(
                    children: [
                      Checkbox(value: isChecked, onChanged: (value){}),
                      Text('volunteer', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      )),
                    ]
                  ),

                  Row(
                    children: [
                      Checkbox(value: isChecked, onChanged: (value){
                        isChecked = value!;
                      }),
                      Text('user', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      )),
                    ]
                  )
                  
                ],
              )
              
            ],
          ),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 85, 169, 87)
            ),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
            },
            child: Text('Submit', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ))),

            
            
        ],
      ),
    ))
    );
  }
}
