import 'package:flutter/material.dart';
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
                datesalida: DateFormat('EEEE, dd/MM/yy').format(start),
                datevuelta: DateFormat('EEEE, dd/MM/yy').format(end));
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
                    labelText: DateFormat('EEEE, dd/MM/yy').format(start),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 15),
            ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                onPressed: pickDateRange,
                child: Text('Seleccionar días de licencia')),
            SizedBox(height: 15),
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: DateFormat('EEEE, dd/MM/yy').format(end),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 15),
            const SizedBox(height: 15),
            Text(
              'Licencia pedida:  ${difference.inDays} días',
              style: TextStyle(fontSize: 32),
            ),
            ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                //onPressed: buildObservaciones,
                onPressed: () {},
                child: Text('OBSERVACIONES')),
          ],
        ),
      ),
    );
  }

  bool checkLimit(DateTime limitDay) {
    if (limitDay.isBefore(dateRange.start)) {
      return false;
    } else if (limitDay.isAfter(dateRange.end)) {
      return false;
    }
    return true;
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().day - 1),
      lastDate: DateTime(DateTime.now().year + 3),
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
    Intl.defaultLocale = 'es';
  }

  Widget buildObservaciones(Empleado) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OBSERVACIONES',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            empleado.vacacionesList.toString(),
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      );
}
