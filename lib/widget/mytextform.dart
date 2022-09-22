import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  MyTextForm({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.keyboard,
  });

  final controller;
  final label;
  final hint;
  final icon;
  final keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboard,
      decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                  width: 2, color: Color.fromARGB(255, 53, 114, 54))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(25.0),
          ),
          filled: true,
          labelText: this.label,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          hintText: this.hint),
      controller: this.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'POR FAVOR COMPLETE EL CAMPO';
        }
        return null;
      },
    );
  }
}
