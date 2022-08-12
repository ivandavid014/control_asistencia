import 'dart:convert';

Vacaciones vacacionesFromJson(String str) =>
    Vacaciones.fromJson(json.decode(str));

String vacacionesToJson(Vacaciones data) => json.encode(data.toJson());

class Vacaciones {
  Vacaciones({
    this.datesalida,
    this.datevuelta,
    this.diaspedidos,
    this.diasrestantes,
    this.diascorrespondientes,
  });

  String? datesalida;
  String? datevuelta;
  int? diaspedidos;
  int? diasrestantes;
  int? diascorrespondientes;

  factory Vacaciones.fromJson(Map<String, dynamic> json) => Vacaciones(
      datesalida: json["datesalida"],
      datevuelta: json["datevuelta"],
      diaspedidos: json["diaspedidos"],
      diasrestantes: json["diasrestantes"],
      diascorrespondientes: json["diascorrespondientes"]);

  get difference => null;

  Map<String, dynamic> toJson() => {
        "datesalida": datesalida,
        "datevuelta": datevuelta,
        "diaspedidos": diaspedidos,
        "diasrestantes": diasrestantes,
        "diascorrespondientes": diascorrespondientes,
      };
}
