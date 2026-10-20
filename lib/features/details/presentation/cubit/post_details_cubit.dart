import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typicode_example/features/posts/data/models/models.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';

part 'post_details_cubit.freezed.dart';
part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit(this._postsRepository) : super(const PostDetailsState());

  final PostsRepository _postsRepository;

  Future<void> loadPost({required int id, Post? initialPost}) async {
    if (initialPost != null) {
      emit(state.copyWith(status: .success, post: initialPost));
      return;
    }

    emit(state.copyWith(status: .loading));

    try {
      final post = await _postsRepository.getPostById(id);
      emit(state.copyWith(status: .success, post: post));
    } on Exception catch (e) {
      emit(state.copyWith(status: .failure, error: e.toString()));
    }
  }
}
