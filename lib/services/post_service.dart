import 'package:flutter_freezed/core/contants.dart';
import 'package:flutter_freezed/model/post_model.dart';
import 'package:flutter_freezed/services/dioService.dart';

class PostService {
  Future<List<PostModel>> fetchPosts() async {
    try {
      DioService dioService = DioService.instance;
      final response = await dioService.dio.get('$baseURL/posts');
      return (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }
}
