import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  State<Cadastro> createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 800,
            height: 800,
            child: Column(
              children: [
                Image.asset(
                  "assets/NeryHourC.png",
                  width: 150,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 40),
                Text(
                  'Cadastro',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
