import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DatosEmpl> fetchDatosEmpl(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DatosEmpl.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class DatosEmpl {
  final num id;
  final String title;

  DatosEmpl({required this.id, required this.title});

  static DatosEmpl fromJson(Map<String, dynamic> async) {
    return DatosEmpl(
      id: 2,
      title: 'Jorge',
    );
  }
}
