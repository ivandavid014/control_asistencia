import 'package:control_personal_municipal/art24.dart';
import 'package:control_personal_municipal/art25.dart';
import 'package:control_personal_municipal/art50.dart';
import 'package:control_personal_municipal/artLicencia.dart';
import 'package:control_personal_municipal/dto/DTOempleado.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';

// ignore: must_be_immutable
class EmpleadoPage extends StatefulWidget {
  Empleado empleado;

  EmpleadoPage(this.empleado);
  @override
  State<EmpleadoPage> createState() => _EmpleadoPageState(empleado);
}

class _EmpleadoPageState extends State<EmpleadoPage> {
  int _currentIndex = 2;
  Empleado? empleado;

  _EmpleadoPageState(this.empleado);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Art24(empleado),
      Art25(empleado),
      Profile(empleado),
      Art50(),
      ArtLicencia(empleado),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_sharp,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        // title: Text(empleado!.apellido! + ', ' + empleado!.nombre!),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[900],
        animationDuration: const Duration(seconds: 2),
        height: 50,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined, color: Colors.white),
            label: 'Art. 24',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined, color: Colors.white),
            label: 'Art. 25',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded, color: Colors.white),
            label: 'PROFILE',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined, color: Colors.white),
            label: 'Art. 50',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.flight_outlined, color: Colors.white),
            label: 'Vacaciones',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
        ],
      ),
    );
  }
}
