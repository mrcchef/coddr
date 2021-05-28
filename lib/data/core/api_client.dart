import 'dart:convert';

import 'package:coddr/data/core/api_constants.dart';
import 'package:http/http.dart';

class APIClient {
  final Client _client;

  APIClient(this._client);

  Future<dynamic> get(String path) async {
    final String url = '${APIConstants.BASE_URL}$path';
    print(url);
    final response = await _client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody;
    } else
      return Exception(response.reasonPhrase);
  }
}
