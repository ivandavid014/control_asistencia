import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:control_personal_municipal/DTOs/DTOvacaciones.dart';
import '../DTOs/DTOempleado.dart';
import '../main.dart';

// ignore: must_be_immutable
class Licencia extends StatefulWidget {
  int indexVac;
  int indexemple;
  Licencia(this.indexemple, this.indexVac);

  @override
  State<Licencia> createState() => _LicenciaState();
}

class _LicenciaState extends State<Licencia> {
  Empleado empleado;
  _LicenciaState(this.empleado);
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
      appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("Agregar nueva licencia")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: 300,
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    Vacaciones vac = Vacaciones(
                      dateSalida: DateFormat('EEEE, dd/MM/yy').format(start),
                      dateVuelta: DateFormat('EEEE, dd/MM/yy').format(end),
                      id: empleados[widget.indexemple]
                          .vacacionesList[widget.indexVac]
                          .id,
                      /*dateSalida: empleados[widget.indexemple]
                          .vacacionesList[widget.indexVac]
                          .dateSalida,
                      dateVuelta: empleados[widget.indexemple]
                          .vacacionesList[widget.indexVac]
                          .dateVuelta,*/
                      diasPedidos: empleados[widget.indexemple]
                          .vacacionesList[widget.indexVac]
                          .diasPedidos,
                      diasRestantes: empleados[widget.indexemple]
                          .vacacionesList[widget.indexVac]
                          .diasRestantes,
                      diasCorrespondientes: empleados[widget.indexemple]
                          .vacacionesList[widget.indexVac]
                          .diasCorrespondientes,
                    );
                    empleados[widget.indexemple]
                        .vacacionesList[widget.indexVac] = vac;
                    await guardarDatos(empleados);
                    Navigator.of(context).pop();
                  },
                  child: Text('GUARDAR'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(MediaQuery.of(context).size.width, 35),
                    primary: Color.fromARGB(255, 31, 179, 122),
                  ),
                ),
              ),
            ),
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: DateFormat('EEEE, dd/MM/yy').format(start),
                    labelStyle: TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white60),
                    ))),
            SizedBox(height: 15),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 179, 122)),
                onPressed: pickDateRange,
                child: Text('Seleccionar días de licencia'),
              ),
            ),
            SizedBox(height: 15),
            TextField(
                enabled: false,
                decoration: InputDecoration(
                    labelText: DateFormat('EEEE, dd/MM/yy').format(end),
                    labelStyle: TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            SizedBox(height: 5),
            const SizedBox(height: 15),
            Text(
              'Licencia pedida:  ${difference.inDays} días',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 15),
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

  Widget buildObservaciones(empleado) => Column(
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
