import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  final http.Client _client;

  HttpService({
    http.Client client,
  }) : _client = client ?? http.Client();

  Future<String> postReq(String token, String url, Map body) async {
    final http.Response response = await _client.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body));
    return response.body;
  }
}
