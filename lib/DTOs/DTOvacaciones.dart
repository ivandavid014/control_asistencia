import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'DTOempleado.dart';

Vacaciones vacacionesFromJson(String str) => Vacaciones.fromJson(json.decode(str));
String vacacionesToJson(Vacaciones data) => json.encode(data.toJson());

@Entity()
class Vacaciones {
  Vacaciones({
    this.id= 0,
    this.dateSalida= '',
    this.dateVuelta= '',
    this.diasPedidos=0,
    this.diasRestantes= 0,
    this.diasCorrespondientes= 0,
  });
  int id = 0;
  String? dateSalida;
  String? dateVuelta;
  int? diasPedidos;
  int? diasRestantes;
  int? diasCorrespondientes;

  var vacaciones = ToOne<Empleado>();


  factory Vacaciones.fromJson(Map<String, dynamic> json) => Vacaciones(
      dateSalida: json["datesalida"],
      dateVuelta: json["datevuelta"],
      diasPedidos: json["diaspedidos"],
      diasRestantes: json["diasrestantes"],
      diasCorrespondientes: json["diascorrespondientes"]);

  Map<String, dynamic> toJson() => {
        "datesalida": dateSalida,
        "datevuelta": dateVuelta,
        "diaspedidos": diasPedidos,
        "diasrestantes": diasRestantes,
        "diascorrespondientes": diasCorrespondientes,
      };
}
