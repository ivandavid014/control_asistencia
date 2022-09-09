import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'DTOempleado.dart';

DtoArt50 vacacionesFromJson(String str) => DtoArt50.fromJson(json.decode(str));
String vacacionesToJson(DtoArt50 data) => json.encode(data.toJson());

@Entity()
class DtoArt50 {
  DtoArt50({
    this.datePedido,
    this.pedidosAnual,
  });
  int id = 0;
  String? datePedido;
  int? pedidosAnual;
  
  var art50 = ToOne<Empleado>();

  factory DtoArt50.fromJson(Map<String, dynamic> json) => DtoArt50(
        datePedido: json["datepedido"],
        pedidosAnual: json["pedidosanual"],
      );

  get difference => null;

  Map<String, dynamic> toJson() => {
        "datePedido": datePedido,
        "pedidosAnual": pedidosAnual,
      };
}
