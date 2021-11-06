import 'dart:convert';

import 'package:coddr/data/core/api_constants.dart';
import 'package:http/http.dart';

class APIClient {
  final Client _client;

  APIClient(this._client);

  Future<dynamic> get(String path, {Map<String, dynamic> params}) async {
    final String url = getPath(path, params: params);
    print(url);
    final response = await _client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.statusCode);
    print(response);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      return responseBody;
    } else
      return Exception(response.reasonPhrase);
  }

  String getPath(String path, {Map<String, dynamic> params}) {
    String url = '';
    String paramsPath = '';
    if (params?.isNotEmpty ?? false) {
      params.forEach((key, value) {
        if (value is String && value.isNotEmpty) {
          paramsPath += '$key=$value';
        } else if (value is List && value.isNotEmpty) {
          //we have to implement null safety here
          paramsPath += '$key=';
          value.forEach((element) {
            paramsPath += '$element;';
          });
        }
      });
    }
    url = '${APIConstants.BASE_URL}$path';
    url += paramsPath;
    return url;
  }
}
