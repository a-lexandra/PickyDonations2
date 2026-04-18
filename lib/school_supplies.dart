import 'package:donation_app/app_bar.dart';
import 'package:donation_app/home_page.dart';
import 'package:flutter/material.dart';

class SchoolSupplies extends StatelessWidget {
  const SchoolSupplies({super.key});

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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return HomePage();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                      fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('School Supplies', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                      ),
                    )),

                  SizedBox(width: 20),
                  
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return HomePage();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                      fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Clothes', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                      ),
                    )),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return HomePage();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                      fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Electronics', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                      ),
                    )),

                  SizedBox(width: 20),
                  
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return HomePage();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                      fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Toys', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                      ),
                    )),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return HomePage();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                      fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Furniture', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                      ),
                    )),

                  SizedBox(width: 20),
                  
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return HomePage();
                      }),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 137, 216, 131),
                      fixedSize: Size(150, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Appliances', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                      ),
                    )),
                ],
              ),
            ],
          ),
        ),
      ),)
    );
  }
}