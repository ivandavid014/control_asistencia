import 'package:flutter/material.dart';

class NuevoEmpleado extends StatelessWidget {
  const NuevoEmpleado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey[890],
        title: Text('AÑADIR NUEVO EMPLEADO'),
      ),
      body: Container(
        child: Text('Cargar nuevo empleado'),
      ),
    );
  }
}
