import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({super.key, required this.user});
  
  @override
  State<Home> createState() => HomeState();

  
}

class HomeState extends State<Home> {
  List<Hour> listahoras =[];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user),
      appBar: AppBar(
        title: Text('NeryHour'),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação ao pressionar o botão
        },
        child: Icon(Icons.add),
      ),
      body: (listahoras.isEmpty) ? 
      Center(child: Text('Nenhuma hora registrada \n Vamos registrar uma?',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18),)) :

    );
  }
}
