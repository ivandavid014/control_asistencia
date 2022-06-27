import 'dart:convert';

import 'package:control_personal_municipal/vacacionesDTO.dart';

Empleado empleadoFromJson(String str) => Empleado.fromJson(json.decode(str));

String empleadoToJson(Empleado data) => json.encode(data.toJson());

class Empleado {
  Empleado({
    this.nombre,
    this.apellido,
    this.dni,
    this.condicion,
    this.codigo,
    this.distancia,
    this.diasLicencia,
    this.vacacionesList,
  });

  String? nombre;
  String? apellido;
  int? dni;
  String? condicion;
  int? codigo;
  bool? distancia;
  int? diasLicencia;
  List<Vacaciones>? vacacionesList;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        nombre: json["nombre"],
        apellido: json["apellido"],
        dni: json["dni"],
        condicion: json["condicion"],
        codigo: json["codigo"],
        distancia: json["distancia"],
        diasLicencia: json["diaslicencia"],
        vacacionesList: json["vacacionesList"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "condicion": condicion,
        "codigo": codigo,
        "distancia": distancia,
        "diaslicencia": diasLicencia,
        "vacacionesList": vacacionesList,
      };
}
