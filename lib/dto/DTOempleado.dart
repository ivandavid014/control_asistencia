import 'dart:convert';

import 'package:control_personal_municipal/dto/DTOvacaciones.dart';

Empleado empleadoFromJson(String str) => Empleado.fromJson(json.decode(str));

String empleadoToJson(Empleado data) => json.encode(data.toMap());

class Empleado {
  Empleado({
    this.nombre,
    this.apellido,
    this.dni,
    this.condicion,
    this.codigo,
    this.movilidad,
    this.distancia,
    this.diasCorrespondientes,
    this.telefono,
    this.vacacionesList,
  });

  String? nombre;
  String? apellido;
  int? dni;
  String? condicion;
  int? codigo;
  bool? movilidad;
  bool? distancia;
  int? telefono;
  int? diasCorrespondientes;
  List<Vacaciones>? vacacionesList;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        nombre: json["nombre"],
        apellido: json["apellido"],
        dni: json["dni"],
        condicion: json["condicion"],
        codigo: json["codigo"],
        movilidad: json["movilidad"] == 1,
        distancia: json["distancia"] == 1,
        diasCorrespondientes: json["diasCorrespondientes"],
        telefono: json["telefono"],
        vacacionesList: json["vacacionesList"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "condicion": condicion,
        "codigo": codigo,
        "movilidad": movilidad,
        "distancia": distancia,
        "diasCorrespondientes": diasCorrespondientes,
        "telefono": telefono,
        "vacacionesList": vacacionesList,
      };

  Map<String, dynamic> toMapsinvacs() => {
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "condicion": condicion,
        "codigo": codigo,
        "movilidad": movilidad,
        "distancia": distancia,
        "telefono": telefono,
        "diasCorrespondientes": diasCorrespondientes,
      };
}
