import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horas/FireServices/FireAuth.dart';

class Home extends StatelessWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user.displayName != null ? user.displayName! : "",
            ),
            accountEmail: Text(user.email!),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.manage_accounts_rounded, size: 48),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ), //o leading faz com que eu possa posicionar um icone ou algo do tipo no canto esquerdo do titulo
            title: const Text("Sair"),
            onTap: () {
              builder:
              (BuildContext dialogContext) {
                return AlertDialog(
                  title: const Text("Voce realmente deseja sair"),
                  content: Text("Voce realmente deseja prosseguir?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancelar"),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Sair", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              };
            },
          ),
        ],
      ),
    );
  }
}
