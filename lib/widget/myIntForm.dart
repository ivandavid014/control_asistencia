import 'package:flutter/material.dart';

class MyIntForm extends StatelessWidget {
  const MyIntForm(
      {required this.controller, required this.label, required this.hint});

  final controller;
  final label;
  final hint;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.label,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            hintText: this.hint),
        controller: this.controller,
        validator: (value) {
          if (value! != int || value.isEmpty) {
            return 'POR FAVOR COMPLETE EL CAMPO';
          }
          return null;
        },
      ),
    );
  }
}
