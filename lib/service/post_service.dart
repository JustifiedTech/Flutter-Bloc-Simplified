import 'dart:convert';

import 'package:http/http.dart' as http;

class PostService {
  static const fetchLimit = 15;
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<dynamic>> getPosts(int page) async {
    try {
      final res = await http
          .get(Uri.parse(baseUrl + '?_limit=$fetchLimit&_page=$page}'));
      return jsonDecode(res.body) as List<dynamic>;
    } catch (e) {
      return [e];
    }
  }
}
