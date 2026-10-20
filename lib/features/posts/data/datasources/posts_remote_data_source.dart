import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:typicode_example/features/posts/data/models/models.dart';

class PostsApiException implements Exception {
  const PostsApiException(
    this.message, {
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      '''PostsApiException: $message${statusCode != null ? '(Status: $statusCode)' : ''}''';
}

abstract class PostsRemoteDataSource {
  Future<List<Post>> getPosts();
  Future<Post> getPostById(int id);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  PostsRemoteDataSourceImpl({
    required this._httpClient,
    this._baseUrl = 'https://jsonplaceholder.typicode.com',
  });

  final http.Client _httpClient;
  final String _baseUrl;

  @override
  Future<List<Post>> getPosts() async {
    final uri = Uri.parse('$_baseUrl/posts');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw PostsApiException(
        'Failed to fetch posts',
        statusCode: response.statusCode,
      );
    }

    try {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList
          .map((item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw PostsApiException('Failed to parse posts response: $e');
    }
  }

  @override
  Future<Post> getPostById(int id) async {
    final uri = Uri.parse('$_baseUrl/posts/$id');
    final response = await _httpClient.get(uri);

    if (response.statusCode != 200) {
      throw PostsApiException(
        'Failed to fetch post #$id',
        statusCode: response.statusCode,
      );
    }

    try {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      return Post.fromJson(jsonMap);
    } catch (e) {
      throw PostsApiException('Failed to parse post response: $e');
    }
  }
}
