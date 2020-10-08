import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  Future<String> postReq(String url, Map body) async {
    final Response response = await post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(body));
    return response.body;
  }
}
