import 'package:donation_app/app_bar.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget{
  const AddItem({super.key});

  @override
  State<AddItem> createState() {
    return AddItemState();
  }
}

class AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Upload picture:', style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 19, 97, 29)
                ),),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                  Icon(Icons.image_outlined, size: 130, color: Color.fromARGB(255, 19, 97, 29),),
                  SizedBox(width: 50),

                  Column(
                    children: [
                      Text('select image', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),),
                      SizedBox(height: 5),
                      Text('take photo', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),)
                    ],
                  )
                  ],
                ),

                SizedBox(height: 20),

                TextFormField(decoration: const InputDecoration(
                  label: Text('Product name', style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)
                ),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Please enter the product name';
                  }
                  return null;
                },
                ),

                SizedBox(height: 25),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      //select category
                      Text('select category (list)', style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),),

                      SizedBox(height: 25),

                      //select condition
                        Text('select condition (list)', style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),),
                    ]
                  ),
                ),
                
                SizedBox(height: 15),
                
                TextFormField(decoration: const InputDecoration(
                  label: Text('Add description (optional)', style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)
                )),

                SizedBox(height: 100),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 85, 169, 87)
                    ), 
                    child: Text('Done', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                    ),)),
                ),
                
              ],
            ),
          ),
        ),),
    );
  }
}