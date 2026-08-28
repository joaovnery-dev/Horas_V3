import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horas/Telas/Horas.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({super.key, required this.user});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Hour> listahoras = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user),
      appBar: AppBar(title: Text('NeryHour')),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação ao pressionar o botão
        },
        child: Icon(Icons.add),
      ),
      body: (listahoras.isEmpty)
          ? const Center(
              child: Text(
                'Nenhuma hora registrada \n Vamos registrar uma?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: listahoras.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final hora = listahoras[index];
                return Card(
                  elevation: 3, // Sombra do retângulo
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                  ), // Espaço entre os retângulos
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 48,
                          color: Colors.blue,
                        ),

                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hora.data,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                hora.minutos.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),
                              SizedBox(height: 12),
                              hora.descricao != null
                                  ? Text(
                                      hora.descricao!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8,
                                      ),
                                    )
                                  : Text(
                                      "Sem descrição",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
