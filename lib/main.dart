import 'package:donation_app/home_page.dart';
import 'package:donation_app/loading_page.dart';
import 'package:donation_app/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme:ThemeData(useMaterial3: true),
    home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const LoadingPage();
          }
          
          if(snapshot.hasData){
            return const HomePage();
          }

          return const StartScreen();
        }),
      );
}
}