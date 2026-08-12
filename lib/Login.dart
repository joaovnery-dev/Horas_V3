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
        padding: EdgeInsets.all(120),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            height: 650,
            width: 800,
            child: Column(
              children: [
                Image.asset(
                  'assets/NeryHourC.png',
                  width: 150,
                  height: 170,
                  fit: BoxFit.cover, // Ajusta a imagem ao espaço disponível
                ),

                SizedBox(height: 40),
                Text(
                  'Bem-vindo ao NeryHour',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60),

                Texto(
                  controller: emailController,
                  labelText: 'E-mail',
                  hintText: 'Digite seu e-mail',
                ),
                SizedBox(height: 40),
                Texto(
                  controller: passwordController,
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
