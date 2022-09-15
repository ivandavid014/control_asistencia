import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'DTOempleado.dart';

DtoArt50 art50FromJson(String str) => DtoArt50.fromJson(json.decode(str));
String art50ToJson(DtoArt50 data) => json.encode(data.toJson());

@Entity()
class DtoArt50 {
  DtoArt50({
    this.id =0,
    this.datePedido = '',
    this.horas50 = 0,
  });
  int id = 0;
  String? datePedido;
  int? horas50;
  
  final art50 = ToOne<Empleado>();

  factory DtoArt50.fromJson(Map<String, dynamic> json) => DtoArt50(
        datePedido: json["datepedido"],
        horas50: json["horas50"],
      );


  Map<String, dynamic> toJson() => {
        "datePedido": datePedido,
        "horas50": horas50,
      };
}
