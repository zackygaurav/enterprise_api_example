part of 'post_details_cubit.dart';

enum PostDetailsStatus { initial, loading, success, failure }

@freezed
abstract class PostDetailsState with _$PostDetailsState {
  const factory PostDetailsState({
    @Default(PostDetailsStatus.initial) PostDetailsStatus status,
    Post? post,
    @Default('') String error,
  }) = _PostDetailsState;
}
