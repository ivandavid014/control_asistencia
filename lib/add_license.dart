import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AddLicense extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AddLicense> {
  DateTime? _myDateTime;
  String timeSalida = 'Fecha de Salida';
  String timeVuelta = 'Fecha de Vuelta';
  String licencia = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_sharp),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text("Agregar nueva licencia")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 10, 10),
        child: Column(children: [
          TextField(
              decoration: InputDecoration(
                  labelText: '$timeSalida',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
          SizedBox(height: 15),
          ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
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
                  timeSalida =
                      DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);
                });
              },
              child: Text('Seleccionar fecha de salida')),
          SizedBox(height: 15),
          TextField(
              onChanged: (timeVuelta) {
                print('$timeVuelta');
              },
              decoration: InputDecoration(
                  labelText: '$timeVuelta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
          SizedBox(height: 15),
          ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () async {
                _myDateTime = (await showDatePicker(
                  context: context,
                  initialDate: _myDateTime ?? DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 3),
                  lastDate: DateTime(DateTime.now().year + 3),
                ));
                if (_myDateTime == null) return;
                setState(() {
                  Intl.defaultLocale = 'es';
                  timeVuelta =
                      DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);
                });
              },
              child: Text('Seleccionar fecha de vuelta')),
        ]),
      ),
    );
  }
}
