import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/dto/DTOempleado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';
//import 'package:sqflite/sqflite.dart';
//import 'db.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    }
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('es')],
      title: 'Control de Personal',
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[850],
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

@override
Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.yellow),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: const Icon(Icons.navigation),
      ),
    ),
    body: Container(color: Color.fromARGB(255, 104, 104, 104)),
    appBar: AppBar(backgroundColor: Colors.green),
  );
}
