import 'package:donation_app/app_bar.dart';
import 'package:donation_app/appliances.dart';
import 'package:donation_app/clothes.dart';
import 'package:donation_app/electronics.dart';
import 'package:donation_app/furniture.dart';
import 'package:donation_app/home_page.dart';
import 'package:donation_app/school_supplies.dart';
import 'package:donation_app/toys.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return SchoolSupplies();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    //  backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                    //  fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/school_supplies.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), 
                            BlendMode.darken
                          ),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 120,
                        //width:
                        alignment: Alignment.center,
                        child: Text('School Supplies', style: TextStyle(
                        //  color: Color.fromARGB(255, 19, 97, 29),
                        color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                      
                    ),
                  ),

                  SizedBox(height: 20),
                  
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return Clothes();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    //  backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                    //  fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/clothes.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken
                          )
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text('Clothes', style: TextStyle(
                        //  color: Color.fromARGB(255, 19, 97, 29),
                        color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                    )
                      ),
                    ),
                    ),
              //   ],
              // ),

              SizedBox(height: 20),

              // Row(
              //   children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return Electronics();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    //  backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                    //  fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/electronics.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken
                          )
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text('Electronics', style: TextStyle(
                          //color: Color.fromARGB(255, 19, 97, 29),
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                          ),
                        )
                      )
                      
                    )
                  ),

                  SizedBox(height: 20),
                  
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return Toys();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    //  backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                    //  fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/toys.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken
                          )
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text('Toys', style: TextStyle(
                        //  color: Color.fromARGB(255, 19, 97, 29)
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    )
                    ),
              //   ],
              // ),

              SizedBox(height: 20),

              // Row(
              //   children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return Furniture();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    //  backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                    //  fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/furniture.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken
                          )
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text('Furniture', style: TextStyle(
                          //color: Color.fromARGB(255, 19, 97, 29)
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold 
                          ),
                        )
                      ),
                    )
                    ),

                  SizedBox(height: 20),
                  
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return Appliances();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    //  backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                    //  fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/appliances.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken
                          )
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text('Appliances', style: TextStyle(
                          //color: Color.fromARGB(255, 19, 97, 29)
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    )
                    ),

              //   ],
              // ),

              // SizedBox(height: 50,),

              //       //TEST BUTOANE
                  
              //       GestureDetector(
              //         onTap: (){
              //           print('merge');
              //         },
              //         child: Container(
              //           height: 120,
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               image: AssetImage("assets/logo.jpg"),
              //               fit: BoxFit.cover,
              //               colorFilter: ColorFilter.mode(
              //                 Colors.black.withOpacity(0.4), 
              //                 BlendMode.darken
              //               ),
              //             ),
              //             borderRadius: BorderRadius.circular(12)
              //           ),
              //           alignment: Alignment.center,
              //           child: Text('BUTON 1', style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 22,
              //             fontWeight: FontWeight.bold
              //           ),)),

              //       ),


              //       SizedBox(height: 20,),


              //       InkWell(
              //         onTap: () {
              //           print('MERGE');
              //         },
              //         child: Stack(
              //           children: [
              //             // Background image
              //             Container(
              //               height: 120,
              //               width: double.infinity,
              //               decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                   image: AssetImage("assets/logo.jpg"),
              //                   fit: BoxFit.cover,
              //                 ),
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             ),

              //             // Fade overlay
              //             Container(
              //               height: 120,
              //               width: double.infinity,
              //               decoration: BoxDecoration(
              //                 color: Colors.black.withOpacity(0.4),
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             ),

              //             // Text
              //             Center(
              //               child: Text(
              //                 "BUTON 2",
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 22,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),



              //       SizedBox(height: 20,),


              //       ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           padding: EdgeInsets.zero,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         onPressed: () {},
              //         child: Ink(
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               image: AssetImage("assets/logo.jpg"),
              //               fit: BoxFit.contain,
              //               colorFilter: ColorFilter.mode(
              //                 Colors.black.withOpacity(0.4),
              //                 BlendMode.darken,
              //               ),
              //             ),
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //           child: Container(
              //             height: 120,
              //           //  width: 100,
              //             alignment: Alignment.center,
              //             child: Text(
              //               "BUTON 3",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),


                  





            ],
          ),
        ),
      ),)
    );
  }
}