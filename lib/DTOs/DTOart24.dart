import 'dart:convert';

DtoArt24 vacacionesFromJson(String str) => DtoArt24.fromJson(json.decode(str));

String vacacionesToJson(DtoArt24 data) => json.encode(data.toJson());

class DtoArt24 {
  DtoArt24({
    this.datePedido,
    this.pedidosAnual,
  });

  String? datePedido;
  int? pedidosAnual;

  factory DtoArt24.fromJson(Map<String, dynamic> json) => DtoArt24(
        datePedido: json["datepedido"],
        pedidosAnual: json["pedidosanual"],
      );

  get difference => null;

  Map<String, dynamic> toJson() => {
        "datePedido": datePedido,
        "pedidosAnual": pedidosAnual,
      };
}
