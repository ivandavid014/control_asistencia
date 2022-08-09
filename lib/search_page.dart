import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';
import 'empleado_page.dart';
import 'dto/DTOempleado.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<Empleado> fullList = empleados;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text('BÚSQUEDA DE PERSONAL'),
        ),
        body: Column(
          children: [
            Container(
                color: Colors.grey[400],
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Ingrese nombre o código del personal',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white24))),
                  onChanged: filtrado,
                )),
            Expanded(
              child: ListView.builder(
                itemCount: fullList.length,
                itemBuilder: (context, index) {
                  final empleado = fullList[index];
                  return Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 128, 128, 128), width: 1),
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment(0.4, 0.9),
                        colors: <Color>[
                          Color(0x9dc1fa),
                          Colors.grey.shade700,
                        ],
                        stops: <double>[0.1, 1],
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(3, 5, 3, 3),
                    child: ListTile(
                      leading: Image.network(
                        empleado.urlFoto.toString(),
                        fit: BoxFit.cover,
                        width: 45,
                        height: 65,
                      ),
                      title: Text(
                        empleado.codigo.toString() +
                            ' - ' +
                            empleado.apellido! +
                            ', ' +
                            empleado.nombre!,
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                        maxLines: 2,
                      ),
                      subtitle: Text('Estación: ${empleado.estacion}'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmpleadoPage(fullList[index]),
                        ),
                      ),
                    ),
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
      final nombreEmpleado = empleado.nombre!.toLowerCase();
      final codigoEmpleado = empleado.codigo!.toString().toLowerCase();
      final reparticionEmpleado = empleado.estacion!.toLowerCase();
      final input = query.toLowerCase();

      return apellidoEmpleado.contains(input) ||
          nombreEmpleado.contains(input) ||
          reparticionEmpleado.contains(input) ||
          codigoEmpleado.contains(input);
    }).toList();

    fullList = sugerencias;

    setState(() {});
  }
}
