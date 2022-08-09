import 'package:flutter/material.dart';
import 'CRUD/returns_50.dart';
import 'dto/DTOempleado.dart';

// ignore: must_be_immutable
class Art50 extends StatelessWidget {
  Empleado? empl;

  Art50(this.empl);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[800],
      child: Center(
        child: Row(
          children: [
            Divider(),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ret50(empl!),
                    ),
                  );
                },
                child: Text('PEDIR HORAS'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (Ret50(empl!)),
                    ),
                  );
                },
                child: Text('DEVOLVER HORAS'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
            ),
            Divider(),
            /*  SizedBox.expand(
              child: InkWell(
                child: ListView.builder(
                  itemCount: empl!.vacacionesList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 128, 128, 128),
                            width: 1),
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
                          'Pidió ' +
                              ' ${empl!.vacacionesList![index].datesalida}. ' +
                              'Va devolviendo ${empl!.vacacionesList![index].datevuelta}',
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
            ), */
          ],
        ),
      ),
    );
  }
}
