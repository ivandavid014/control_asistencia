import 'package:control_personal_municipal/CRUD/add_licence.dart';
import 'package:flutter/material.dart';
import '../main.dart';

// ignore: must_be_immutable
class ArtLicencia extends StatelessWidget {
  int indexVac;
  int indexemple;
  ArtLicencia(this.indexemple, this.indexVac);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.green),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Licencia(indexVac, indexemple)));
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      body: InkWell(
        child: ListView.builder(
          itemCount: empleados[indexemple].vacacionesList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 128, 128, 128), width: 1),
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.4, 0.9),
                  colors: <Color>[
                    Color(0x9dc1fa),
                    Colors.grey.shade700,
                  ],
                  stops: <double>[0.1, 1],
                ),
              ),
              margin: EdgeInsets.fromLTRB(3, 5, 3, 3),
              child: ListTile(
                title: Text(
                  'Licencia pedida desde el ' +
                      ' ${empleados[indexemple].vacacionesList[indexVac].dateSalida}' +
                      ' hasta el${empleados[indexemple].vacacionesList[indexVac].dateVuelta}. Son ${empleados[indexemple].vacacionesList[indexVac].diasPedidos} días, de ${empleados[indexemple].vacacionesList[indexVac].diasCorrespondientes} disponibles.',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                  maxLines: 5,
                ),
                /*   onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmpleadoPage(empleados[index]),
                  ),
                ), */
              ),
            );
          },
        ),
      ),
    );
  }
}
