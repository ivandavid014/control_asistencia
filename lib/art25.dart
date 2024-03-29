import 'package:flutter/material.dart';
import 'CRUD/add_25.dart';
import 'dto/DTOempleado.dart';

// ignore: must_be_immutable
class Art25 extends StatelessWidget {
  Empleado? empl;

  Art25(this.empl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.green),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Add25(empl!)));
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      body: InkWell(
        child: ListView.builder(
          itemCount: empl!.vacacionesList!.length,
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
                      ' ${empl!.vacacionesList![index].datesalida}' +
                      ' hasta el ${empl!.vacacionesList![index].datevuelta}. Son xxx días, de ${empl!.diasCorrespondientes!} disponibles.',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                  maxLines: 5,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
