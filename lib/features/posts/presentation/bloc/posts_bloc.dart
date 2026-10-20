
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typicode_example/features/posts/data/models/models.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';

part 'posts_bloc.freezed.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this._postsRepository) : super(const PostsState(status: .initial)) {
    on<PostsFetched>(_onPostsFetched);
  }

  final PostsRepository _postsRepository;

  Future<void> _onPostsFetched(
    PostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: .loading));

    try {
      final posts = await _postsRepository.getPosts();
      emit(state.copyWith(posts: posts, status: .success));
    } on Exception catch (e) {
      emit(
        state.copyWith(status: .failure, error: e.toString()),
      );
    }
  }
}
