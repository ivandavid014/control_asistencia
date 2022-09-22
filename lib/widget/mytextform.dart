import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm(
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
            //contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            border: OutlineInputBorder(),
            filled: true,
            labelText: this.label,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            hintText: this.hint),
        controller: this.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'POR FAVOR COMPLETE EL CAMPO';
          }
          return null;
        },
      ),
    );
  }
}