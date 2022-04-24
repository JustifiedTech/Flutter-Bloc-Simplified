import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final client = http.Client();
  final String _baseUrl = 'https://dev.plateaumed.com/api/v1';
  final String token = '';
  Map<String, String> get header => {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };

  Future<dynamic> getToken(String path) async {
    // log('Started');
    try {
      final response =
          await client.get(Uri.parse('$_baseUrl/$path'), headers: header);

      final result = jsonDecode(response.body);
      log('Started');
      log(result.toString());
      return result;
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> auth(String path, body) async {
    log(jsonEncode(body));
    log('$_baseUrl/$path');

    try {
      final response = await http.post(Uri.parse('$_baseUrl/$path'),
          headers: header, body: jsonEncode(body));
      final result = jsonDecode(response.body);
      log(result.toString());
      return result;
      // }

    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
      // return e.toString();
    }
  }

  Future<dynamic> postToken(String path, body) async {
    log(jsonEncode(body));
    log('$_baseUrl/$path');

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/$path'),
        headers: header,
        body: jsonEncode(body),
      );
      final result = jsonDecode(response.body);
      return result.toString();
      // }

    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
      // return e.toString();
    }
  }
}
// curl --location --request GET 'https://dev.plateaumed.com/api/v1/users/whoami'