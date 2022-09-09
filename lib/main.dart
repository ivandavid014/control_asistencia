import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/DTOs/DTOempleado.dart';
import 'package:control_personal_municipal/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';
import 'package:objectbox/objectbox.dart';


void main() {
  runApp(MyApp());
}

//final _empleados = <Empleado>[];
late final Store _store;
late final Box<Empleado> _empleadoBox;

List<Empleado> empleados =[];
void _loadEmpleados(){
  empleados.clear();
  empleados.addAll(_empleadoBox.getAll());
}
  

Future<void> _loadStore() async{
 
  _empleadoBox = _store.box<Empleado>();
  _loadEmpleados();
}




void initState()async{
   _store = await openStore();
 await _loadStore();

 if(empleados.isEmpty){
  
    
  empleados =
     empleadosLista.map((dynamic item) => Empleado.fromJson(item)).toList();
guardarDatos(empleados);

   }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    overDB();

    for (int i = 0; i < empleados.length; i++) {
    //empleados[i].vacacionesList = [];
    //empleados[i].art50List = [];
    //empleados[i].art25List = [];
    //empleados[i].art24List = [];
      empleados[i].dias25 = 0;
      empleados[i].dias24 = 0;
    }
    initState();
    
   

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

Future guardarDatos(List <Empleado> emple)async{
  for (var v = 0; v <emple.length; v++) {
  _empleadoBox.put(emple[v]);
}
_loadStore();
}
