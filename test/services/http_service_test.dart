import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/services/services.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  group('Test Http Service', () {
    test('Should return String response', () async {
      final client = MockClient();
      when(client.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('{"response": "true"}', 200));
      final response = await HttpService(client: client).postReq('url', {});
      expect(response, '{"response": "true"}');
    });
  });
}
