import 'package:animations/animations.dart';
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
      ArtLicencia(empleados.indexOf(empleado!)),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appbarTitles[_currentIndex],
          style: TextStyle(
              fontSize: 20, fontStyle: FontStyle.normal, color: Colors.white),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_rounded,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          fillColor: Colors.black54,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pages[_currentIndex],
      ),

      //body: pages[_currentIndex],  BODY SIN ANIMACION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting, // Shifting

        unselectedItemColor: Colors.grey[800],
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
            backgroundColor: Color.fromARGB(255, 31, 179, 122),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 25',
            backgroundColor: Colors.grey[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil',
            backgroundColor: Color.fromARGB(255, 31, 179, 122),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Art. 50',
            backgroundColor: Colors.grey[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_outlined),
            label: 'Vacaciones',
            backgroundColor: Color.fromARGB(255, 31, 179, 122),
          ),
        ],
      ),
    );
  }
}
