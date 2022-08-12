import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/DTOs/DTOempleado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';

//import 'db.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

/*listaEmpleados() async {
  List<Empleado> auxEmpleado = await DB.empleados();

  setState(() {
    empleados = auxEmpleado;
  });
}*/

List<Empleado> empleados =
    empleadosLista.map((dynamic item) => Empleado.fromJson(item)).toList();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    overDB();

    for (int i = 0; i < empleados.length; i++) {
      empleados[i].vacacionesList = [];
      empleados[i].art50List = [];
      empleados[i].art25List = [];
      empleados[i].art24List = [];
      empleados[i].dias25 = 0;
    }
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('es')],
      title: 'Control de Personal',
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[850],
        dividerColor: Colors.grey,
        brightness: Brightness.light,
        primaryColor: Colors.grey[850],
        fontFamily: 'Calibri',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  void overDB() async {
    /*
    DB databaseStart = DB();

    await databaseStart.insert(empleados.first);

    List<Empleado> empleadosDB = await databaseStart.read();
    empleados = empleadosDB;*/
  }
}
