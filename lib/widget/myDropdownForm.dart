import 'package:flutter/material.dart';

class MyDropdownForm extends StatelessWidget {
  const MyDropdownForm(
      {required this.controller, required this.label, required this.hint});

  final controller;
  final label;
  final hint;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
                    filled: true,
                    iconColor: Colors.green,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 22, 96, 23)))),
                value: selectedRevista,
                items: revista
                    .map((condicion) => DropdownMenuItem<String>(
                        value: condicion,
                        child: Text(condicion,
                            style:
                                TextStyle(fontSize: 19, color: Colors.white))))
                    .toList(),
                onChanged: (condicion) =>
                    setState(() => selectedRevista = condicion),
              ),
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

 
                