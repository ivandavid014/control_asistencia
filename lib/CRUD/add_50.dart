import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../dto/DTOart50.dart';
import '../dto/DTOempleado.dart';

// ignore: must_be_immutable
class Add50 extends StatefulWidget {
  Empleado empleado;

  Add50(this.empleado);
  @override
  _HomeState createState() => _HomeState(empleado);
}

class _HomeState extends State<Add50> {
  Empleado empleado;
  _HomeState(this.empleado);

  DateTime? _myDateTime;
  String datePedido = 'Fecha de Artículo 50';

  int pedidosAnual = 0;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: ElevatedButton(
          onPressed: () {
            Art50 art = Art50(
              datePedido: datePedido,
              pedidosAnual: pedidosAnual,
            );
            empleado.art50List!.insert(0, art);
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("Agregar nuevo artículo 50")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: '$datePedido',
                    labelStyle: TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 15),
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 31, 179, 122)),
              onPressed: () async {
                _myDateTime = (await showDatePicker(
                  locale: const Locale("es", "ES"),
                  context: context,
                  initialDate: _myDateTime ?? DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 3),
                  lastDate: DateTime(DateTime.now().year + 3),
                ));
                if (_myDateTime == null) return;

                setState(() {
                  Intl.defaultLocale = 'es';
                  datePedido =
                      DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);
                });
              },
              child: Text(
                'Seleccionar fecha de pedido',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                onPressed: () async {},
                child: Text('OBSERVACIONES')),
          ],
        ),
      ),
    );
  }
}
