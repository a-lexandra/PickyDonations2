import 'package:donation_app/app_bar.dart';
import 'package:donation_app/user_profile.dart';
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
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                    //   child: ElevatedButton(
                    //   onPressed: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //       return UserProfile();
                    //     }));
                    //   }, 
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Color.fromARGB(255, 85, 169, 87)
                    //    ),
                    //   child: Text('Back', style: TextStyle(
                    //     color: Color.fromARGB(255, 19, 97, 29)
                    //   )),
                    // ),
                    ),
                    

                    Row(
                      children: [

                        Text('institute name', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),),

                        SizedBox(width: 100),

                        IconButton(
                          onPressed: (){}, 
                          icon: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 19, 97, 29),))
                      ],
                    ),

                    Icon(Icons.arrow_right_alt_outlined, size: 30, color: Color.fromARGB(255, 19, 97, 29),),
                    
                    SizedBox(height: 25),

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('name', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),),

                          SizedBox(height: 5),

                          Text('name', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),),

                          SizedBox(height: 5),

                          Text('name', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),),

                          SizedBox(height: 5),

                          Text('name', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
              )
              
              
            ],
          ),
        ),
      ),
    );
  }
}