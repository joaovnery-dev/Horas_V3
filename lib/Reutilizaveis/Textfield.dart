import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  TextEditingController controller;
  String labelText;

  Texto({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
      ),
    );
  }
}
