import 'package:control_personal_municipal/search_page.dart';
import 'package:flutter/material.dart';
import 'CRUD/nuevo_empleado.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[800],
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Image.asset(
              'images/SantaFeCapitallogo.png',
              //  scale: 0.4,
            ),
            Divider(),
            const SizedBox(
              height: 40,
              child: Text(
                'CONTROL DE PERSONAL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
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
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
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
                  shape: StadiumBorder(),
                  fixedSize: Size(MediaQuery.of(context).size.width, 35),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
