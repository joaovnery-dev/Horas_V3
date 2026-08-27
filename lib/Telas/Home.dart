import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  final User user;

  Home({super.key, required this.user});
  
  State<Home> createState() => HomeState();

  
}

class HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text('Home')),
    );
  }
}
