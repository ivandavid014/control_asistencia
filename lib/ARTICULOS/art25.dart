import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../CRUD/contador_25.dart';
import '../DTOs/DTOempleado.dart';
import '../DTOs/DTOart25.dart';
import '../global_consts.dart';

// ignore: must_be_immutable
class Art25 extends StatefulWidget {
  Empleado? empl;

  Art25(this.empl);

  @override
  State<Art25> createState() => _Art25State(empl);
}

class _Art25State extends State<Art25> {
  DateTime? _myDateTime;
  Empleado? empl;
  String datePedido = '';

  int pedidosAnual = 0;
  String? observaciones;
  _Art25State(this.empl);

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
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  /* if (empl!.dias25! <= 5) {
                    agregarArt25toEmpleado();
                  } else {
                    bool res = await confirm(context);
                    if (res) agregarArt25toEmpleado();
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
            buildDivider(),
            SizedBox(
              width: 190,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (Count25(widget.empl!)),
                    ),
                  );
                },
                child: Text(
                  'DÍAS PEDIDOS ANUAL',
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
              height: 80,
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  itemCount: widget.empl!.art25List.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 128, 128, 128),
                            width: 0.1),
                        borderRadius: BorderRadius.circular(10),
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
                          'Pidió artículo 25 el: ' +
                              ' ${widget.empl!.art25List[index].datePedido}. ',
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
                  empl!.art25List.removeAt(index);
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

  void agregarArt25toEmpleado() async {
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

    DtoArt25 art = DtoArt25(datePedido: datePedido, pedidosAnual: pedidosAnual);
    empl!.art25List.insert(0, art);
    empl!.dias25 = empl!.dias25! + 1;
    guardarDatos(empleados);
    setState(() {});
  }
}
