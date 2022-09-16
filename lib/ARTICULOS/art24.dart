import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../CRUD/contador_24.dart';
import '../DTOs/DTOempleado.dart';
import '../DTOs/DTOart24.dart';
import '../main.dart';

// ignore: must_be_immutable
class Art24 extends StatefulWidget {
  Empleado? empl;

  Art24(this.empl);

  @override
  State<Art24> createState() => _Art24State(empl);
}

class _Art24State extends State<Art24> {
  DateTime? _myDateTime;
  Empleado? empl;
  String datePedido = '';

  int pedidosAnual = 0;

  String? observaciones;
  _Art24State(this.empl);
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
                onPressed: () async {
                 /* _myDateTime = await showDatePicker(
                    locale: const Locale("es", "ES"),
                    context: context,
                    initialDate: _myDateTime ?? DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 3),
                    lastDate: DateTime(DateTime.now().year + 3),
                  );
                  if (_myDateTime == null) return;
                  Intl.defaultLocale = 'es';
                  datePedido =
                      DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);



                  DtoArt24 art = DtoArt24(datePedido: datePedido, pedidosAnual: pedidosAnual);
                    empl!.art24List.insert(0, art);
                    empl!.dias24 = empl!.dias24! + 1;
                    guardarDatos(empleados);
                    setState(() {});*/
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
                      builder: (context) => (Count24(widget.empl!)),
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
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 31, 179, 122),
                    Colors.black26,
                  ],
                ),
              ),
              child: InkWell(
                child: ListView.builder(
                  itemCount: widget.empl!.art24List.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 128, 128, 128),
                            width: 0.1),
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment(0.4, 0.5),
                          colors: <Color>[
                            Color(0x9dc1fa),
                            Colors.grey.shade700,
                          ],
                          stops: <double>[0.1, 1],
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(3, 2, 3, 3),
                      child: ListTile(
                        onLongPress: () {
                          _delete(index);
                        },
                        title: Text(
                          'Pidió artículo 24 el: ' +
                              ' ${widget.empl!.art24List[index].datePedido}. ',
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
        ),
      ],
    );
  }

  void _delete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('¿Estás seguro de querer borrar esta entrada?'),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.green.shade600),
                    ),
                  ),
                ),
                onPressed: () {
                  empl!.art24List.removeAt(index);
                  setState(() {});

                  Navigator.of(context).pop();
                },
                child: const Text('SI')),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.red.shade600),
                  ),
                ),
              ),
              autofocus: true,
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

Widget buildDivider() =>
    Container(height: 40, child: VerticalDivider(color: Colors.grey));
