import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'DTOempleado.dart';

DtoArt25 vacacionesFromJson(String str) => DtoArt25.fromJson(json.decode(str));
String vacacionesToJson(DtoArt25 data) => json.encode(data.toJson());

@Entity()
class DtoArt25 {
  DtoArt25({
    this.datePedido,
    this.pedidosAnual,
  });
  int id = 0;
  String? datePedido;
  int? pedidosAnual;

  var art25 = ToOne<Empleado>();

  factory DtoArt25.fromJson(Map<String, dynamic> json) => DtoArt25(
        datePedido: json["datepedido"],
        pedidosAnual: json["pedidosanual"],
      );

  get difference => null;

  Map<String, dynamic> toJson() => {
        "datePedido": datePedido,
        "pedidosAnual": pedidosAnual,
      };
}
