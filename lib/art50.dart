import 'package:flutter/material.dart';
import 'CRUD/add_50.dart';
import 'CRUD/returns_50.dart';
import 'dto/DTOempleado.dart';

// ignore: must_be_immutable
class Art50 extends StatelessWidget {
  Empleado? empl;

  Art50(this.empl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                      builder: (context) => Add50(empl!),
                    ),
                  );
                },
                child: Text(
                  'PEDIR ARTÍCULO',
                  style: TextStyle(fontSize: 19),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
            ),
            buildDivider(),
            SizedBox(
              width: 190,
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
                child: Text(
                  'DEVOLVER HORAS',
                  style: TextStyle(fontSize: 19),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 125,
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: InkWell(
              child: ListView.builder(
                itemCount: empl!.art50List?.length,
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
                    margin: EdgeInsets.fromLTRB(3, 2, 3, 3),
                    child: ListTile(
                      title: Text(
                        'Pidió artículo 50 el: ' +
                            ' ${empl!.art50List![index].datePedido}. ',
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                        maxLines: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildDivider() =>
    Container(height: 40, child: VerticalDivider(color: Colors.grey));
