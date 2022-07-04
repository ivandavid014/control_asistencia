import 'package:sqflite/sqflite.dart';
import 'empleadoDTO.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'empleados.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE empleados (nombre TEXT, apellido TEXT, dni REAL, condicion TEXT, codigo REAL, distancia BOOLEAN NOT NULL CHECK (distancia IN (0, 1)), diasLicencia REAL)",
      );
    }, version: 1);
  }

  static Future<Future<int>> insert(Empleado empleado) async {
    Database database = await _openDB();

    return database.insert("empleados", empleado.toMap());
  }

  static Future<Future<int>> delete(Empleado empleado) async {
    Database database = await _openDB();

    return database
        .delete("empleados", where: "dni = ?", whereArgs: [empleado.dni]);
  }

  static Future<Future<int>> update(Empleado empleado) async {
    Database database = await _openDB();

    return database.update("empleados", empleado.toMap(),
        where: "dni = ?", whereArgs: [empleado.dni]);
  }

  static Future<List<Empleado>> empleados() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> empleadosMap =
        await database.query("empleados");

    return List.generate(
        empleadosMap.length,
        (i) => Empleado(
              nombre: empleadosMap[i]['nombre'],
              apellido: empleadosMap[i]['apellido'],
              dni: empleadosMap[i]['dni'],
              condicion: empleadosMap[i]['condicion'],
              codigo: empleadosMap[i]['codigo'],
              distancia: empleadosMap[i]['distancia'],
              diasLicencia: empleadosMap[i]['diasLicencia'],
              vacacionesList: empleadosMap[i]['vacacionesList'],
            ));
  }
}
