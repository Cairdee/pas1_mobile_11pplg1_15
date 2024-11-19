import 'dart:convert';
import 'package:http/http.dart' as http;
import 'liga_model.dart';

class ApiService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> postsData = jsonResponse['data'];

      return postsData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      print('Failed to load posts: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load posts');
    }
  }
}