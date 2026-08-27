import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:horas/Telas/Login.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:horas/Telas/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, 
    home: RoteadorDeTelas());
    //trocar o null depois
  }



  
}

class RoteadorDeTelas extends StatelessWidget{
 const RoteadorDeTelas({super.key});
  @override Widget build(BuildContext context){
    return StreamBuilder(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      } else if(snapshot.hasData){
        return Home(user: snapshot.data!);
      } else {
        return Login();
      }
    });
  }
    
}