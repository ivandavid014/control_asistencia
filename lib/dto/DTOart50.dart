import 'dart:convert';

Art50 vacacionesFromJson(String str) => Art50.fromJson(json.decode(str));

String vacacionesToJson(Art50 data) => json.encode(data.toJson());

class Art50 {
  Art50({
    this.datePedido,
    this.pedidosAnual,
  });

  String? datePedido;
  int? pedidosAnual;

  factory Art50.fromJson(Map<String, dynamic> json) => Art50(
        datePedido: json["datepedido"],
        pedidosAnual: json["pedidosanual"],
      );

  get difference => null;

  Map<String, dynamic> toJson() => {
        "datePedido": datePedido,
        "pedidosAnual": pedidosAnual,
      };
}
