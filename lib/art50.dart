import 'package:flutter/material.dart';
import 'CRUD/add_50.dart';
import 'dto/DTOempleado.dart';

// ignore: must_be_immutable
class Art50 extends StatelessWidget {
  Empleado? empl;

  Art50(this.empl);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      margin: EdgeInsets.all(5),
      child: Center(
        child: SizedBox(
          height: 512,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Add50(empl!),
                    ),
                  );
                },
                child: Text('PEDIR HORAS'),
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
                      builder: (context) => (Add50(empl!)),
                    ),
                  );
                },
                child: Text('DEVOLVER HORAS'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  fixedSize: Size(MediaQuery.of(context).size.width, 35),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
              SizedBox(
                height: 400,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
