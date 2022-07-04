import 'mock_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'mock_data_test.mocks.dart';
// import ''

@GenerateMocks([http.Client])
void main() {
  testWidgets('mock demo ...', (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
        .thenAnswer((_) async => http.Response(
            '{"userId": 1, "id": 2, "title": "mock munis"}', 200));

    final datos = await fetchDatosEmpl(client);

    expect(datos, isA<DatosEmpl>());
    expect(datos.id, 2);
    expect(datos.title, 'Jorge');
  });
}
