/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:control_personal_municipal/dto/DTOvacaciones.dart';
import '../dto/DTOempleado.dart';

// ignore: must_be_immutable
class AddLicense extends StatefulWidget {
  Empleado empleado;

  AddLicense(this.empleado);
  @override
  _HomeState createState() => _HomeState(empleado);
}

class _HomeState extends State<AddLicense> {
  Empleado empleado;
  _HomeState(this.empleado);
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year - 3),
    end: DateTime(DateTime.now().year + 3),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: ElevatedButton(
          onPressed: () {
            Vacaciones vac = Vacaciones(
                datesalida: timeSalida,
                datevuelta: timeVuelta,
                diaspedidos: 3,
                dni: 23243,
                diasrestantes: 4);
            empleado.vacacionesList!.add(vac);
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text("Agregar nueva licencia")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: '$start',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 15),
            ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                onPressed: pickDateRange,

                /* () async {
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
                }, */
                child: Text('Seleccionar fecha de salida')),
            SizedBox(height: 15),
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: '$end',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 15),
            ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                onPressed: () async {
                  _myDateTime = (await showDatePicker(
                    context: context,
                    initialDate: _myDateTime ?? DateTime.now(),
                    firstDate: DateTime(
                      DateTime.now().year - 1,
                    ),
                    lastDate: DateTime(DateTime.now().year + 2),
                  ));
                  if (_myDateTime == null) return;
                  setState(() {
                    Intl.defaultLocale = 'es';
                    timeVuelta =
                        DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);
                  });
                },
                child: Text('Seleccionar fecha de vuelta')),
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

  Future pickDateRange() async {
    showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2050),
    );
  }
}


/* class _HomeState extends State<AddLicense> {
  Empleado empleado;
  _HomeState(this.empleado);

  DateTime? _myDateTime;
  late Calculo = .substract(timeVuelta);
  String timeSalida = 'Fecha de inicio de licencia';
  String timeVuelta = 'Fecha de retorno';
  String licencia = '0';
  late int diaspedidos;
  late int diasrestantes;
  late int diascorrespondientes;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: ElevatedButton(
          onPressed: () {
            Vacaciones vac = Vacaciones(
                datesalida: timeSalida,
                datevuelta: timeVuelta,
                diaspedidos: 3,
                dni: 23243,
                diasrestantes: 4);
            empleado.vacacionesList!.add(vac);
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text("Agregar nueva licencia")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: '$timeSalida',
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
                    timeSalida =
                        DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);
                  });
                },
                child: Text('Seleccionar fecha de salida')),
            SizedBox(height: 15),
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: '$timeVuelta',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 15),
            ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                onPressed: () async {
                  _myDateTime = (await showDatePicker(
                    context: context,
                    initialDate: _myDateTime ?? DateTime.now(),
                    firstDate: DateTime(
                      DateTime.now().year - 1,
                    ),
                    lastDate: DateTime(DateTime.now().year + 2),
                  ));
                  if (_myDateTime == null) return;
                  setState(() {
                    Intl.defaultLocale = 'es';
                    timeVuelta =
                        DateFormat('EEEE, dd/MM/yy').format(_myDateTime!);
                  });
                },
                child: Text('Seleccionar fecha de vuelta')),
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
 */ */