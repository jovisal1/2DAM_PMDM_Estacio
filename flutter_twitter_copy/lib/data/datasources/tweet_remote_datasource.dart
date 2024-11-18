import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TweetRemoteDataSource {
  final String _baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';

  TweetRemoteDataSource();

  Future<List<dynamic>> getTweets() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/tweets'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Fallo al obtener todos los tweets: ${response.body}');
    }
  }

  Future<void> createTweet(String userId, String content, String? image) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/tweets'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'userId': userId, 'content': content, 'image': image}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed al crear el tweet: ${response.body}');
    }
  }

  Future<void> deleteTweet(String tweetId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/tweets/$tweetId/delete'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Fallo al eliminar el tweet: ${response.body}');
    }
  }

  Future<void> likeTweet(String tweetId, String userId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/tweets/$tweetId/like'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'userId': userId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al hacer like en el tweet: ${response.body}');
    }
  }

  Future<void> updateTweet(
      String tweetId, String? content, String? image) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/tweets/$tweetId/update'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'content': content, 'image': image}),
    );

    if (response.statusCode != 200) {
      throw Exception('Fallo al crear el tweet: ${response.body}');
    }
  }

  Future<List<dynamic>> getFollowUsersTweets(String userId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/tweets?userId=$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Fallo al obtener los tweets del usuario: ${response.body}');
    }
  }

  Future<bool> followUser(String userToFollow, String userId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/users/$userToFollow/update'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'userId': userId}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Fallo al seguir a un usuario: ${response.body}');
    }
  }
}
