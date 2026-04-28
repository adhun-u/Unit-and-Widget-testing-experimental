import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:study/network/json_service.dart';

void main() {
  final url = "https://jsonplaceholder.typicode.com/posts/1";

  group("json testing", () {
    test('Json should return body successfully', () async {
      MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({
            "id": 1,
            "userId": 1,
            "title": "Some title will be here",
            "subtitle": "Some subtitle will be here",
          }),
          200,
        );
      });

      JsonService jsonService = JsonService(mockClient);

      final body = await jsonService.getJsonResponse(url);

      expect(body.length, 4);
    });

    test('Json should return empty body', () async {
      MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode({}), 404);
      });

      JsonService jsonService = JsonService(mockClient);

      final body = await jsonService.getJsonResponse(url);

      expect(body.length, 0);
    });

    test('Json should return client exception', () async {
      MockClient mockClient = MockClient((request) async {
        throw Exception('Some exception');
      });

      JsonService jsonService = JsonService(mockClient);

      expect(
        jsonService.getJsonResponse(url),
        throwsA(isA<http.ClientException>()),
      );
    });
  });
}
