import 'dart:convert';

Vacaciones vacacionesFromJson(String str) =>
    Vacaciones.fromJson(json.decode(str));

String vacacionesToJson(Vacaciones data) => json.encode(data.toJson());

class Vacaciones {
  Vacaciones({
    this.datesalida,
    this.datevuelta,
    this.dni,
    this.diaspedidos,
    this.diasrestantes,
  });

  String? datesalida;
  String? datevuelta;
  int? dni;
  int? diaspedidos;
  int? diasrestantes;

  factory Vacaciones.fromJson(Map<String, dynamic> json) => Vacaciones(
        datesalida: json["datesalida"],
        datevuelta: json["datevuelta"],
        dni: json["dni"],
        diaspedidos: json["diaspedidos"],
        diasrestantes: json["diasrestantes"],
      );

  Map<String, dynamic> toJson() => {
        "datesalida": datesalida,
        "datevuelta": datevuelta,
        "dni": dni,
        "diaspedidos": diaspedidos,
        "diasrestantes": diasrestantes,
      };
}
