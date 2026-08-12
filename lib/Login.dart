import 'package:flutter/material.dart';
import 'package:horas/Reutilizaveis/Textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            height: 800,
            width: 800,
            child: Column(
              children: [
                Image.asset(
                  'assets/NeryHourC.png',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover, // Ajusta a imagem ao espaço disponível
                ),

                SizedBox(height: 20),
                Text(
                  'Bem-vindo ao NeryHour',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                Texto(controller: emailController, labelText: 'Email'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
