import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm(
      {required this.controller, required this.label, required this.hint});

  final controller;
  final label;
  final hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          hintText: this.hint),
      controller: this.controller,
    );
  }
}
