import 'package:flutter/material.dart';

class Home extends StatefulWidget {
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
