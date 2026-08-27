import 'package:flutter/material.dart';
import 'package:horas/Telas/Cadastro.dart';
import 'package:horas/Reutilizaveis/Textfield.dart';
import 'package:horas/FireServices/FireAuth.dart';
import 'package:horas/Telas/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Auth auth = Auth();
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
                  esenha: false,
                ),
                SizedBox(height: 40),
                Texto(
                  controller: passwordController,
                  labelText: 'Senha',
                  esenha: true,
                  hintText: 'Digite sua senha',
                ),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    // Ação ao clicar no botão de login
                  },
                  child: Image.asset(
                    'assets/google.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  child: Text(
                    "Não tem conta? cadastre-se",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String? result = await auth.login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (result != null) {
                      // Exibir mensagem de erro
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home(user: FirebaseAuth.instance.currentUser!)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF6366F1,
                    ), // Azul Indigo moderno
                    foregroundColor: Colors.white, // Cor do texto
                    elevation: 3, // Sombra sutil
                    shadowColor: const Color(
                      0xFF6366F1,
                    ).withOpacity(0.4), // Sombra colorida suave
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // Cantos arredondados premium
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight
                          .w600, // Negrito elegante (não muito grosso)
                      letterSpacing: 0.5, // Leve espaçamento entre letras
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
