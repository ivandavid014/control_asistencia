import 'package:control_personal_municipal/add_license.dart';
import 'package:flutter/material.dart';
import 'DTOempleado.dart';

class ArtLicencia extends StatelessWidget {
  Empleado? empl;

  ArtLicencia(this.empl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddLicense(empl!)));
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      body: InkWell(
        child: ListView.builder(
          itemCount: empl!.vacacionesList!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Licencia pedida desde el ' +
                  ' ${empl!.vacacionesList![index].datesalida}' +
                  ' hasta el ${empl!.vacacionesList![index].datevuelta}'),
            );
          },
        ),
      ),
    );
  }
}
