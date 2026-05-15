import 'package:donation_app/home_page.dart';
import 'package:donation_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class LogIn extends StatefulWidget{
  const LogIn({super.key});

  @override
  State<LogIn> createState() {
    return LogInState();
  }
}


class LogInState extends State<LogIn>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _Eemail = TextEditingController();
  final TextEditingController _Epass = TextEditingController();

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    
    if(!isValid){
      return;
    }
    _formKey.currentState!.save();
    
    try{
      final _userCredentials = await _firebase.signInWithEmailAndPassword(email: _Eemail.text.trim(), password: _Epass.text.trim());
    //  print(_userCredentials);
    }on FirebaseAuthException catch(error){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message ?? 'Log in failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 193, 252, 189) ,
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
      child: Center(

      child: SingleChildScrollView(

      child: Column(
        children: [

          SizedBox(height: 20),

          Text("Log in", style: TextStyle(
            color: Color.fromARGB(255, 19, 97, 29),
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
          //textAlign: TextAlign.left,
          ),

          SizedBox(height: 130),

          TextFormField(controller: _Eemail, decoration: InputDecoration(
            label: Text('email', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29),
            ),),
          ),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          validator: (value) {
            if(value == null || value.trim().isEmpty || !value.contains('@')){
              return 'Please enter a valid email';
            }
            return null;
          },
          ),

          SizedBox(height: 30),

          TextFormField(controller: _Epass, decoration: InputDecoration(
            label: Text('password', style: TextStyle(
              color: Color.fromARGB(255, 19, 97, 29)
            ),),
          ),
          obscureText: true,
          validator: (value){
            if(value == null || value.trim().length < 6){
              return 'Password should be at least 6 characters';
            }
            return null;
          }
          ),

          SizedBox(height: 100),

          ElevatedButton(
            onPressed: (){
              _submit();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const App()),
                  (route) => false,
                );
              },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 85, 169, 87),
              minimumSize: Size(200, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
            ),
          // onPressed:(){
          //   Navigator.push(
          //     context, 
          //     MaterialPageRoute(builder: (context){
          //       return HomePage();
          //     }));
          // },
          child: Text('Submit', style: TextStyle(
            color: Color.fromARGB(255, 19, 97, 29),
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),))
        ],
      ),
      )
        ))
    ));
  }
}