import 'package:flutter/material.dart';
import 'package:horas/Reutilizaveis/Textfield.dart';
import 'package:horas/FireServices/FireAuth.dart';

class Cadastro extends StatefulWidget {
  State<Cadastro> createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  Auth auth = Auth();
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
               
                  Row(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,color: Colors.black,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              
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
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    // Ação do botão
                    String? result = await auth.Register(
                      nome.text,
                      email.text,
                      senha.text,
                    );
                    if (nome.text.isEmpty ||
                        email.text.isEmpty ||
                        senha.text.isEmpty ||
                        csenha.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Por favor, preencha todos os campos."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      if (result != null) {
                        // Exibir mensagem de erro
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(result)));
                      } else {
                        if (senha.text != csenha.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("As senhas não coincidem."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          // Registro bem-sucedido
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Registro bem-sucedido!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pop(context);
                          });
                        }
                        // Registro bem-sucedido
                      }
                    }
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
