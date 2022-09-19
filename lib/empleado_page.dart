import 'package:control_personal_municipal/ARTICULOS/art50.dart';
import 'package:control_personal_municipal/ARTICULOS/art25.dart';
import 'package:control_personal_municipal/ARTICULOS/art24.dart';
import 'package:control_personal_municipal/ARTICULOS/artLicencia.dart';
import 'package:control_personal_municipal/DTOs/DTOempleado.dart';
import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';

import 'global_consts.dart';
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
      Art50(empleados.indexOf(empleado!)),
      ArtLicencia(empleados.indexOf()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitles[_currentIndex]),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_rounded,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        // title: Text(empleado!.apellido! + ', ' + empleado!.nombre!),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting, // Shifting

        unselectedItemColor: Colors.grey,
        elevation: 100,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.twenty_four_mp_sharp),
            label: 'Art. 24',
            backgroundColor: Colors.grey[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 25',
            backgroundColor: Colors.grey[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil',
            backgroundColor: Colors.green[300],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 50',
            backgroundColor: Colors.grey[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_outlined),
            label: 'Vacaciones',
            backgroundColor: Colors.blue[300],
          ),
        ],
      ),
    );
  }
}
