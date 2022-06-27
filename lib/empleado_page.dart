import 'package:control_personal_municipal/art24.dart';
import 'package:control_personal_municipal/art25.dart';
import 'package:control_personal_municipal/art50.dart';
import 'package:control_personal_municipal/artLicencia.dart';
import 'package:control_personal_municipal/empleadoDTO.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmpleadoPage extends StatefulWidget {
  Empleado empleado;

  EmpleadoPage(this.empleado);
  @override
  State<EmpleadoPage> createState() => _EmpleadoPageState(empleado);
}

class _EmpleadoPageState extends State<EmpleadoPage> {
  int _currentIndex = 0;
  Empleado? empleado;

  _EmpleadoPageState(this.empleado);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Art24(),
      Art25(),
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
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(empleado!.apellido! + ', ' + empleado!.nombre!)),
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPictureSize: Size(370, 170),
            accountName: Text(''),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/aca.jpg'),
            ),
          ),
          ListTile(
            title: Text(empleado!.apellido! + ', ' + empleado!.nombre!),
            onTap: () {},
          ),
          ListTile(
            title: Text(empleado!.codigo.toString()),
            onTap: () {},
          ),
          ListTile(
            title: Text('Condición municipal: ' + empleado!.condicion!),
            onTap: () {},
          ),
          ListTile(
            title:
                Text('Días de licencia: ' + empleado!.diasLicencia.toString()),
            onTap: () {},
          ),
        ],
      )),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        animationDuration: const Duration(seconds: 2),
        height: 70,
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
            label: 'Art. 50',
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
            label: 'Licencia',
            selectedIcon: Icon(Icons.arrow_circle_up_sharp),
          ),
        ],
      ),
    );
  }
}
