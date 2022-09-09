import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'DTOvacaciones.dart';
import 'DTOart24.dart';
import 'DTOart25.dart';
import 'DTOart50.dart';

//Empleado empleadoFromJson(String str) => Empleado.fromJson(json.decode(str));

String empleadoToJson(Empleado data) => json.encode(data.toMap());

@Entity()

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
    required this.vacacionesList,
    required this.art50List,
    required this.art24List,
    required this.art25List,
    this.urlFoto,
    this.estacion,
    this.horas50,
    this.dias24,
    this.dias25,
  });

  int id = 0;
  String? nombre;
  String? apellido;
  int? dni;
  String? condicion;
  int? codigo;
  bool? movilidad;
  bool? distancia;
  int? telefono;
  int? diasCorrespondientes;

  @Backlink()
  var vacacionesList = ToMany<Vacaciones>();

  @Backlink()
  var art50List = ToMany<DtoArt50>();

  @Backlink()
  var art24List = ToMany<DtoArt24>();

  @Backlink()
  var art25List = ToMany<DtoArt25>();
  

  String? urlFoto;
  String? estacion;
  int? horas50;
  int? dias24;
  int? dias25;

 
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
        vacacionesList: json["vacacionesList"] == null?  ToMany<Vacaciones>():json["vacacionesList"],
        art50List: json["art50List"]== null? ToMany<DtoArt50>():json["art50List"],
        art24List: json["art24List"]== null? ToMany<DtoArt24>():json["art24List"],
        art25List: json["art25List"]== null? ToMany<DtoArt25>():json["art25List"],
        urlFoto: json["urlFoto"],
        estacion: json["estacion"],
        horas50: json["horas50"],
        dias24: json["dias24"],
        dias25: json["dias25"],
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
        "dias24": dias24,
        "dias25": dias25,
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
        "dias24": dias24,
        "dias25": dias25,
      };
}
