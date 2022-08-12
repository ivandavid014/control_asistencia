import 'dart:convert';

DtoArt25 vacacionesFromJson(String str) => DtoArt25.fromJson(json.decode(str));

String vacacionesToJson(DtoArt25 data) => json.encode(data.toJson());

class DtoArt25 {
  DtoArt25({
    this.datePedido,
    this.pedidosAnual,
  });

  String? datePedido;
  int? pedidosAnual;

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
