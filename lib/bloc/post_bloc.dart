import 'package:bloc/bloc.dart';
import 'package:flutter_freezed/bloc/post_event.dart';
import 'package:flutter_freezed/bloc/post_state.dart';
import 'package:flutter_freezed/services/post_service.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService _postService;

  PostBloc(this._postService) : super(Initial()) {
    on<PostEvent>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(PostEvent event, Emitter<PostState> emit) async {
    emit(Loading());
    try {
      final posts = await _postService.fetchPosts();
      emit(Loaded(posts));
    } catch (e) {
      emit(Error("Failed to fetch posts"));
    }
  }
}
