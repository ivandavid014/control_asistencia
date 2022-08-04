import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'DTOempleado.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<Empleado> FullList = empleados;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ingrese busqueda'),
        ),
        body: Column(
          children: [
            Container(
                child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hoverColor: Colors.green,
              ),
              onChanged: filtrado,
            )),
            Expanded(
              child: ListView.builder(
                itemCount: FullList.length,
                itemBuilder: (context, index) {
                  final empleado = FullList[index];
                  return ListTile(
                    title: Text(empleado.apellido!),
                  );
                },
              ),
            )
          ],
        ));
  }

  void filtrado(String query) {
    final sugerencias = empleados.where((empleado) {
      final apellidoEmpleado = empleado.apellido!.toLowerCase();
      final input = query.toLowerCase();

      return apellidoEmpleado.contains(input);
    }).toList();
    FullList = sugerencias;

    setState(() {});
  }
}
