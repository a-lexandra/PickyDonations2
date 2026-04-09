import 'package:donation_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class CreateAccount extends StatefulWidget{
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState(){
    return CreateAccountState();
  }
}


class CreateAccountState extends State<CreateAccount>{
  final _formKey = GlobalKey<FormState>();
  //bool isChecked = false;
  var _Eemail = '';
  var _Epass = '';
  var _Euser = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }
    _formKey.currentState!.save();

    try{
      final _userCredentials = await _firebase.createUserWithEmailAndPassword(email: _Eemail, password: _Epass);
      print(_userCredentials);
    }on FirebaseAuthException catch (error){
      // if(error.code == 'email-already-in-use'){
      //   //message
      // }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message ?? 'Authentication failed')));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 252, 189),
    
    body: Padding(
      padding: EdgeInsets.all(20.0),
    child: Form(
      key: _formKey,
    child: Center(
      child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 80),

          Text('Create account', style: TextStyle(
            color: Color.fromARGB(255, 19, 97, 29),
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),),

          SizedBox(height: 50),

          TextFormField(decoration: const InputDecoration(
            label: Text('username', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),)
            
          ),
          validator: (value) {
            if(value == null || value.trim().isEmpty){
              return 'Please enter a username';
            }
            return null;
          },
          onSaved: (value){
            _Euser = value!;
          },
          ),

          SizedBox(height: 30),

          TextFormField(decoration: const InputDecoration(
            label: Text('email', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),)
          ),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          validator: (value){
            if(value == null || value.trim().isEmpty || !value.contains('@')){
              return 'Please enter a valid email';
            }

            return null;
          },
          onSaved: (value){
            _Eemail = value!;
          },
          ),

          SizedBox(height: 30),

          TextFormField(decoration: const InputDecoration(
            label: Text('password', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),)
          ),
          obscureText: true,
          validator: (value){
            if(value == null || value.trim().length < 6){
              return 'Password should be at least 6 characters long';
            }
            return null;
          },
          onSaved: (value){
            _Epass = value!;
          },
          ),

          SizedBox(height: 30),

          // Row(
          //   children: [
          //     Text('Account type:', style: TextStyle(
          //       color: Color.fromARGB(255, 19, 97, 29)
          //     )),
          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             Checkbox(value: isChecked, onChanged: (value){}),
          //             Text('admin', style: TextStyle(
          //               color: Color.fromARGB(255, 19, 97, 29)
          //             ),),
          //           ]
          //         ),

          //         Row(
          //           children: [
          //             Checkbox(value: isChecked, onChanged: (value){}),
          //             Text('volunteer', style: TextStyle(
          //               color: Color.fromARGB(255, 19, 97, 29)
          //             )),
          //           ]
          //         ),

          //         Row(
          //           children: [
          //             Checkbox(value: isChecked, onChanged: (value){
          //               isChecked = value!;
          //             }),
          //             Text('user', style: TextStyle(
          //               color: Color.fromARGB(255, 19, 97, 29)
          //             )),
          //           ]
          //         )
                  
          //       ],
          //     )
              
          //   ],
          // ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 85, 169, 87)
            ),
            //onPressed: (){
              //_submit();

              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(builder: (context){
              //     return HomePage();
              //   }));
            //},
            child: Text('Submit', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ))),

            
            
        ],
      ),
      )
    ))
    ));
  }
}
