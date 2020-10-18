import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  http.Client client;

  HttpService({
    http.Client client,
  }) : client = client ?? http.Client();

  Future<String> postReq(String url, Map body) async {
    final http.Response response = await client.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(body));
    return response.body;
  }
}
