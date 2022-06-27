import 'package:control_personal_municipal/add_license.dart';
import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';

import 'empleadoDTO.dart';

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddLicense()));
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      body: InkWell(
        child: ListView.builder(
          itemCount: empl!.vacacionesList!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  'Licencia' + ' ${empl!.vacacionesList![index].datesalida}'),
            );
          },
        ),
      ),
    );
  }
}
