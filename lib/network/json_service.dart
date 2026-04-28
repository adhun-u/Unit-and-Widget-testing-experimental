import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonService {
  final http.Client _client;

  JsonService(this._client);
  Future<Map<String, dynamic>> getJsonResponse(String url) async {
    try {
      final res = await _client.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final body = res.body;
        final parsedBody = jsonDecode(body) as Map<String, dynamic>;
        return parsedBody;
      } else {
        return {};
      }
    } catch (e) {
      throw http.ClientException('Error');
    }
  }
}
