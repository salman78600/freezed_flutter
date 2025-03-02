import 'package:flutter_freezed/model/post_model.dart';

sealed class PostState {}

class Initial extends PostState {}

class Loading extends PostState {}

class Loaded extends PostState {
  final List<PostModel> posts;

  Loaded(this.posts);
}

class Error extends PostState {
  final String message;

  Error(this.message);
}
