import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horas/Reutilizaveis/Textfield.dart';

class Cadastro extends StatefulWidget {
  State<Cadastro> createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  TextEditingController senha = TextEditingController();
  TextEditingController csenha = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nome = TextEditingController();

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

                SizedBox(height: 40),
                Texto(
                  esenha: false,
                  controller: nome,
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                ),
                SizedBox(height: 20),

                Texto(
                  esenha: false,
                  controller: email,
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                ),

                SizedBox(height: 20),

                Texto(
                  esenha: false,
                  controller: senha,
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                ),
                SizedBox(height: 20),
                Texto(
                  esenha: true,
                  controller: csenha,
                  labelText: 'Confirme sua senha',
                  hintText: 'Digite a sua senha novamente',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
