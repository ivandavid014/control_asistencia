import 'dart:convert';
import 'package:control_personal_municipal/DTOs/DTOart25.dart';

import '../ARTICULOS/art24.dart';
import '../ARTICULOS/art25.dart';
import 'DTOvacaciones.dart';
import 'DTOart50.dart';

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
    this.art50List,
    this.art24List,
    this.art25List,
    this.urlFoto,
    this.estacion,
    this.horas50,
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
  List<DtoArt50>? art50List;
  List<Art24>? art24List;
  List<DtoArt25>? art25List;
  String? urlFoto;
  String? estacion;
  int? horas50;

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
        art50List: json["art50List"],
        art24List: json["art24List"],
        art25List: json["art25List"],
        urlFoto: json["urlFoto"],
        estacion: json["estacion"],
        horas50: json["horas50"],
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
        "art50List": art50List,
        "art24List": art24List,
        "art25List": art25List,
        "estacion": estacion,
        "horas50": horas50,
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
        "urlFoto": urlFoto,
        "estacion": estacion,
        "horas50": horas50,
      };
}
