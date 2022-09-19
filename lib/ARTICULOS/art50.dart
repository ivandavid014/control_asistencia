import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../CRUD/returns_50.dart';
import '../DTOs/DTOart50.dart';

// ignore: must_be_immutable
class Art50 extends StatefulWidget {
  int? indexEmple;
  Art50(this.indexEmple);

  @override
  State<Art50> createState() => _Art50State();
}

class _Art50State extends State<Art50> {
  DateTime? _myDateTime;
  String datePedido = '';
  int horas50 = 0;
  String? observaciones;
  _Art50State();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  agregarArt50toEmpleado();
                  /*if (empl!.dias50! <= 5) {
                  } else {
                   bool res = await confirm(context);
                    if (res) agregarArt50toEmpleado();
                  }*/
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
            // SizedBox(
            //   width: 190,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => (Ret50(widget.indexEmple!,0)),
            //         ),
            //       );
            //     },
            //     child: Text(
            //       'HORAS DEVUELTAS',
            //       style: TextStyle(fontSize: 19),
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       shape: StadiumBorder(),
            //       primary: Color.fromARGB(255, 31, 179, 122),
            //     ),
            //   ),
            // ),
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
                  reverse: true,
                  itemCount: empleados[widget.indexEmple!].art50List.length,
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
                        onTap: () async {
                          // ignore: unused_local_variable
                          final res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Ret50(widget.indexEmple!, index),
                            ),
                          );
                          setState(() {});
                        },
                        onLongPress: () {
                          _delete(index);
                        },
                        title: Text(
                          'Pidió artículo 50 el: ' +
                              '${empleados[widget.indexEmple!].art50List[index].datePedido}. ',
                          style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                        subtitle: Text(
                            'Horas devueltas: ${empleados[widget.indexEmple!].art50List[index].horas50}'),
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
                onPressed: () async {
                  empleados[widget.indexEmple!].art50List.removeAt(index);
                  await guardarDatos(empleados);
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

  void agregarArt50toEmpleado() async {
    _myDateTime = await showDatePicker(
      locale: const Locale("es", "ES"),
      context: context,
      initialDate: _myDateTime ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    if (_myDateTime == null) return;
    Intl.defaultLocale = 'es';
    datePedido = DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);

    DtoArt50 art = DtoArt50(datePedido: datePedido, horas50: horas50);
    empleados[widget.indexEmple!].art50List.add(art);
    guardarDatos(empleados);
    setState(() {});
  }
}
