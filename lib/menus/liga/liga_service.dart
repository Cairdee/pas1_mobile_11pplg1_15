import 'dart:convert';
import 'package:http/http.dart' as http;
import 'liga_model.dart';

class AnimeService {
  static const String baseUrl = 'https://api.jikan.moe/v4/anime';

  static Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load anime');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
} 