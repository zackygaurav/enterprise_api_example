part of 'posts_bloc.dart';

enum PostsStatus { initial, loading, success, failure }

@freezed
abstract class PostsState with _$PostsState {
  const factory PostsState({
    @Default(PostsStatus.initial) PostsStatus status,
    @Default([]) List<Post> posts,
    @Default('') String error,
  }) = _PostsState;
}
