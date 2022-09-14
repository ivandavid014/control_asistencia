import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'DTOempleado.dart';

DtoArt50 vacacionesFromJson(String str) => DtoArt50.fromJson(json.decode(str));
String vacacionesToJson(DtoArt50 data) => json.encode(data.toJson());

@Entity()
class DtoArt50 {
  DtoArt50({
    this.datePedido,
    this.horasDevueltas,
  });
  int id = 0;
  String? datePedido;
  int? horasDevueltas;
  
  var art50 = ToOne<Empleado>();

  factory DtoArt50.fromJson(Map<String, dynamic> json) => DtoArt50(
        datePedido: json["datepedido"],
        horasDevueltas: json["horasDevueltas"],
      );

  get difference => null;

  Map<String, dynamic> toJson() => {
        "datePedido": datePedido,
        "horasDevueltas": horasDevueltas,
      };
}
