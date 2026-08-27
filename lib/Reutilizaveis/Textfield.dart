import 'package:flutter/material.dart';

class Texto extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool esenha;
  const Texto({
    super.key,
    required this.esenha,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  State<Texto> createState() => TextoState();
}

class TextoState extends State<Texto> {
  late bool senha;
  late bool senhav;
  void initState() {
    super.initState();
    senha = widget.esenha;
    senhav = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: senha ? senhav ? true : false : false,
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),

      decoration: InputDecoration(
        suffixIcon: senha
            ? IconButton(
                icon: Icon(senhav ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    senhav = !senhav; // Alterna entre aberto e fechado
                  });
                },
              )
            : null,

        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: Colors.blueGrey,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14.0),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        // Border when the field is enabled but not focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
        ),
        // Border when the field is focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
        // Border when there is an error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        // Border when focused and there is an error
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}
