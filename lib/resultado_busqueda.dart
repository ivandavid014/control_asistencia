import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';
import 'empleadoDTO.dart';
import 'empleado_page.dart';

// ignore: must_be_immutable
class ListaResultados extends StatelessWidget {
  int index;
  List<Empleado> aux;
  ListaResultados(this.index, this.aux);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: listaResultados(index, empleados, context),
      margin: EdgeInsets.only(top: 10),
      height: 140,
      width: double.infinity,
    );
  }

  Widget listaResultados(
      int index, List<Empleado> empleados, BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmpleadoPage(empleados.first)),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 25, 5, 0),
        alignment: Alignment.centerLeft,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade600, width: 3),
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0.4, 0.9),
            colors: <Color>[
              Color(0xFFEEEEEE),
              Colors.greenAccent,
            ],
            stops: <double>[0.1, 1],
          ),
        ),
        padding: EdgeInsets.all(28.0),
        child: Text(
          empleados[index].codigo.toString() +
              ' - ' +
              empleados[index].apellido! +
              ', ' +
              empleados[index].nombre!,
          style: TextStyle(
              fontSize: 20, fontStyle: FontStyle.normal, color: Colors.white),
          maxLines: 1,
        ),
      ),
    ));
  }
}
