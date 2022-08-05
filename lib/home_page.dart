import 'package:control_personal_municipal/search_page.dart';
import 'package:flutter/material.dart';

import 'CRUD/nuevo_empleado.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      margin: EdgeInsets.all(5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Image.asset(
              'images/SantaFeCapitallogo.png',
              scale: 0.4,
            ),
            Text(
              'CONTROL DE PERSONAL',
              style: Theme.of(context).textTheme.headline5,
            ),
            FloatingActionButton.extended(
                heroTag: "boton busqueda",
                shape: RoundedRectangleBorder(),
                elevation: 12,
                focusElevation: 5,
                backgroundColor: Color.fromARGB(255, 31, 179, 122),
                foregroundColor: Colors.grey,
                highlightElevation: 25,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ));
                },
                label: Text('VER EMPLEADOS')),
            FloatingActionButton.extended(
              heroTag: "boton add",
              shape: RoundedRectangleBorder(),
              elevation: 12,
              focusElevation: 5,
              backgroundColor: Color.fromARGB(255, 31, 179, 122),
              foregroundColor: Colors.grey,
              highlightElevation: 25,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NuevoEmpleado(),
                    ));
              },
              label: Text('AGREGAR NUEVO EMPLEADO'),
              //icon: Icons.add_outlined),
            )
          ],
        ),
      ),
    );
  }
}
