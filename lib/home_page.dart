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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Text('VER EMPLEADOS'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: Size(MediaQuery.of(context).size.width, 35),
                primary: Color.fromARGB(255, 31, 179, 122),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (NuevoEmpleado()),
                  ),
                );
              },
              child: Text('AGREGAR EMPLEADO NUEVO'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: Size(MediaQuery.of(context).size.width, 35),
                primary: Color.fromARGB(255, 31, 179, 122),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
