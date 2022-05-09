import 'package:control_personal_municipal/art24.dart';
import 'package:control_personal_municipal/art25.dart';
import 'package:control_personal_municipal/art50.dart';
import 'package:control_personal_municipal/artLicencia.dart';
import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/empleadoDTO.dart';
import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 30,
  fontStyle: FontStyle.italic,
  letterSpacing: 3,
  fontWeight: FontWeight.bold,
);

class EmpleadoPage extends StatefulWidget {
  Empleado empleado;

  EmpleadoPage(this.empleado);
  @override
  State<EmpleadoPage> createState() => _EmpleadoPageState(empleado);
}

class _EmpleadoPageState extends State<EmpleadoPage> {
  int _currentIndex = 0;
  Empleado empleado;

  _EmpleadoPageState(this.empleado);
  List<Widget> pages = const [
    Art24(),
    Art25(),
    Art50(),
    ArtLicencia(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(empleado.apellido! + ', ' + empleado.nombre!)),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green[400],
        animationDuration: const Duration(seconds: 1),
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Licencia',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 24',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 25',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 50',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
        ],
      ),
    );
  }
}
