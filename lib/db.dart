import 'package:sqflite/sqflite.dart';
import 'DTOempleado.dart';
import 'package:path/path.dart';

class DB {
  Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'empleados.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE empleados (nombre TEXT, apellido TEXT, dni INTEGER, condicion TEXT, codigo INTEGER, distancia BOOLEAN, diasCorrespondientes INTEGER)",
      );
    }, version: 1);
  }

  Future insert(Empleado empleado) async {
    Database database = await _openDB();

    return database.insert("empleados", empleado.toMapsinvacs());
  }

  Future delete(Empleado empleado) async {
    Database database = await _openDB();

    return database
        .delete("empleados", where: "dni = ?", whereArgs: [empleado.dni]);
  }

  Future update(Empleado empleado) async {
    Database database = await _openDB();

    return database.update("empleados", empleado.toMap(),
        where: "dni = ?", whereArgs: [empleado.dni]);
  }

  Future<List<Empleado>> read() async {
    Database database = await _openDB();
    List<Map<String, dynamic>> empleadosMap = await database.query("empleados");

    return empleadosMap.map((e) => Empleado.fromJson(e)).toList();
  }
}



/*List.generate(
        empleadosMap.length,
        (i) => Empleado(
              nombre: empleadosMap[i]['nombre'],
              apellido: empleadosMap[i]['apellido'],
              dni: empleadosMap[i]['dni'],
              condicion: empleadosMap[i]['condicion'],
              codigo: empleadosMap[i]['codigo'],
              distancia: empleadosMap[i]['distancia'],
              diasCorrespondientes: empleadosMap[i]['diasCorrespondientes'],
              vacacionesList: empleadosMap[i]['vacacionesList'],
            ));*/