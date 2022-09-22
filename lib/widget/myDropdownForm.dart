import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDropdownForm extends StatefulWidget {
  MyDropdownForm({required this.listValues, required this.firtValue});

  final List listValues;
  String firtValue;
  @override
  State<MyDropdownForm> createState() => _MyDropdownFormState();
}

class _MyDropdownFormState extends State<MyDropdownForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            filled: true,
            iconColor: Colors.green,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    width: 1, color: Color.fromARGB(255, 22, 96, 23)))),
        value: widget.firtValue,
        dropdownColor: Color.fromARGB(255, 93, 189, 122),
        isDense: true,
        items: widget.listValues
            .map(
              (condicion) => DropdownMenuItem<String>(
                value: condicion,
                child: Text(
                  condicion,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
            .toList(),
        onChanged: (condicion) => setState(() => widget.firtValue = condicion!),
      ),
    );
  }
}
