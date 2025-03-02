import 'package:dio/dio.dart';
import 'package:flutter_freezed/core/contants.dart';
import 'package:flutter_freezed/model/post_model.dart';

class PostService {
  final Dio _dio = Dio();

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _dio.get('$baseURL/posts');
      return (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }
}
