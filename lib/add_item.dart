// ignore_for_file: dead_code

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/app_bar.dart';
import 'package:donation_app/user_profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddItem extends StatefulWidget{
  const AddItem({super.key});

  @override
  State<AddItem> createState() {
    return AddItemState();
  }
}


  //dropdown menu
  typedef CategoryPick = DropdownMenuEntry<Categories>;
  enum Categories {
    SchoolSupplies('School supplies', Icons.book),
    Books('Books', Icons.book),
    Clothes('Clothes', Icons.person),
    Electronics('Electronics', Icons.smartphone),
    Toys('Toys', Icons.toys),
    Furniture('Furniture', Icons.chair),
    Appliances('Appliances', Icons.microwave);

    const Categories(this.label, this.icon);
    final String label;
    final IconData icon;

    static final List<CategoryPick> entries = UnmodifiableListView<CategoryPick>(
      values.map<CategoryPick>(
        (Categories icon) => CategoryPick(
          value: icon,
          label: icon.label,
          leadingIcon: Icon(icon.icon)
        ),
      ),
    );
  }
  //dropdown menu

  

class AddItemState extends State<AddItem> {
  var _Eproduct = '';
  var _Edescription = '';
  final _formKey = GlobalKey<FormState>();
  var _Ecategory = '';
  var _Econdition = '';

  File? _pickedPhotoFile;
  Image? _pickedPhoto;
  
  void _uploadPhoto() async {
    if(!_formKey.currentState!.validate()){
      return;
    }
    _formKey.currentState!.save();

    if(_pickedPhotoFile == null){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No photo selected')));
      return;
    }

    if(_Eproduct.trim().isEmpty || _Ecategory.trim().isEmpty || _Econdition.trim().isEmpty){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }

    try{
      final fileName = 'donation_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final storageRef = FirebaseStorage.instance.ref().child('donations').child(fileName);
      await storageRef.putFile(_pickedPhotoFile!);
      final photoURL = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance.collection('donations').doc(DateTime.now().millisecondsSinceEpoch.toString()).set({
        'photoURL': photoURL,
        'productName': _Eproduct,
        'category': _Ecategory.substring(11),
        'condition': _Econdition,
        'description': _Edescription,
        'is_posted': false,
        'is_requested': false,
        'requested_by': null
      });

      if (mounted) {
        Navigator.of(context).pop(); 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item posted successfully!'))
        );
      }


    } catch (e) {
      print('Upload failed: $e');
      return;
    }
  }

  void _selectPhoto() async {
    final selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100, maxWidth: 150);
    if(selectedImage == null){
      return;
    }

    setState(() {
      _pickedPhotoFile = File(selectedImage.path);
      _pickedPhoto = Image.file(_pickedPhotoFile!);
    });
  }

  void _takePhoto() async{
    final takenImage = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 100, maxWidth: 150);
    if(takenImage == null){
      return;
    }

    setState(() {
      _pickedPhotoFile = File(takenImage.path);
      _pickedPhoto = Image.file(_pickedPhotoFile!);
    });
  }

  // dropdown button
  static const List<String> items = <String>['New', 'Used'];
  String _dropdownValue = items.first;

  //dropdown menu e intre cele doua clase, la inceput
  final TextEditingController categController = TextEditingController();
  Categories? selectedCategory;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 193, 252, 189),
      backgroundColor: Colors.white,
      appBar: AppBarS(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
              
              SingleChildScrollView(  
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _pickedPhotoFile != null ? Image.file(_pickedPhotoFile!, width: 160, height: 160, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                      return CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.green[300],
                        child: Icon(Icons.image_outlined, size: 130, color: Color.fromARGB(255, 19, 97, 29),),
                      );
                    },) : CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.green[300],
                      child: Icon(Icons.image_outlined, size: 130, color: Color.fromARGB(255, 19, 97, 29),),
                    ),

                  SizedBox(width: 30),
                
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _selectPhoto, 
                        icon: Icon(Icons.image_outlined, color: Color.fromARGB(255, 19, 97, 29),),
                         style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 85, 169, 87)
                        ),
                        label: Text('select image', style: TextStyle(
                        color: Color.fromARGB(255, 19, 97, 29)
                      ),),),

                      SizedBox(height: 5),
                      
                      ElevatedButton.icon(
                        onPressed: _takePhoto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 85, 169, 87)
                        ),
                        icon: Icon(Icons.camera_alt, color: Color.fromARGB(255, 19, 97, 29),),
                        label: Text('Take photo', style: TextStyle(
                          color: Color.fromARGB(255, 19, 97, 29)
                        ),),
                      ),
                    ],
                  )
                  ],
                ),
              ),

                SizedBox(height: 20),

                TextFormField(
                  decoration: const InputDecoration(
                  label: Text('Product name', style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)
                ),
                onSaved: (value) {
                  _Eproduct = value!;
                },
                ),

                SizedBox(height: 25),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    
                    child:  Row(
                        children: [
                          Text('Category: ', style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),),

                          SizedBox(width: 10),

                          // DropdownButton<String>(
                          //   value: _dropdownValue,
                          //   onChanged: (String? value){
                          //     setState(() {
                          //       _dropdownValue = value!;
                          //     });
                          //   },
                          //   items: items.map<DropdownMenuItem<String>>((String value){
                          //     return DropdownMenuItem<String>(value: value, child: Text(value, style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),), );
                          //   }).toList(),
                          // ),

                          DropdownMenuFormField<Categories>(
                            controller: categController,
                            dropdownMenuEntries: Categories.entries,
                            enableFilter: true,
                            enableSearch: true,
                            requestFocusOnTap: true,
                            leadingIcon: const Icon(Icons.search),
                            label: const Text('choose category'),
                            onSelected: (Categories? category){
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            onSaved: (value){
                              _Ecategory = value!.toString();
                            },
                          ),                          

                        ],
                      ),),
                      
                      SizedBox(height: 25),

                      Row(
                        children: [
                          Text('Condition:', style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 19, 97, 29)
                          ),),

                          SizedBox(width: 10,),

                      Expanded(
                      child: DropdownButtonFormField<String>(
                            value: _dropdownValue, 
                            onChanged: (String? value){
                              setState(() {
                                _dropdownValue = value!;
                              });
                            },
                            items: items.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(value: value, child: Text(value, style: TextStyle(color: Color.fromARGB(255, 19, 97, 29)),), );
                            }).toList(),
                            onSaved: (value){
                              _Econdition = value!.toString();
                            },
                          ),),
                        ],
                      ),

                    ]
                  ),
                ),
                
                SizedBox(height: 15),
                
                TextFormField(
                  decoration: const InputDecoration(
                  label: Text('Add description (optional)', style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 19, 97, 29)
                  ),)
                ),
                onSaved: (value) {
                  _Edescription = value!;
                },
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _uploadPhoto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 85, 169, 87)
                    ), 
                    child: Text('Done', style: TextStyle(
                      color: Color.fromARGB(255, 19, 97, 29)
                    ),)),
                ),
                
              ],
            ),
          ),)
        ),),
    );
  }
}