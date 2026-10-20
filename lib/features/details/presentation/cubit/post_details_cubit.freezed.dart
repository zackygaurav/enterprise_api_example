// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDetailsState {

 PostDetailsStatus get status; Post? get post; String get error;
/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDetailsStateCopyWith<PostDetailsState> get copyWith => _$PostDetailsStateCopyWithImpl<PostDetailsState>(this as PostDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.post, post) || other.post == post)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,post,error);

@override
String toString() {
  return 'PostDetailsState(status: $status, post: $post, error: $error)';
}


}

/// @nodoc
abstract mixin class $PostDetailsStateCopyWith<$Res>  {
  factory $PostDetailsStateCopyWith(PostDetailsState value, $Res Function(PostDetailsState) _then) = _$PostDetailsStateCopyWithImpl;
@useResult
$Res call({
 PostDetailsStatus status, Post? post, String error
});


$PostCopyWith<$Res>? get post;

}
/// @nodoc
class _$PostDetailsStateCopyWithImpl<$Res>
    implements $PostDetailsStateCopyWith<$Res> {
  _$PostDetailsStateCopyWithImpl(this._self, this._then);

  final PostDetailsState _self;
  final $Res Function(PostDetailsState) _then;

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? post = freezed,Object? error = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostDetailsStatus,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostDetailsState].
extension PostDetailsStatePatterns on PostDetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _PostDetailsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PostDetailsStatus status,  Post? post,  String error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
return $default(_that.status,_that.post,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PostDetailsStatus status,  Post? post,  String error)  $default,) {final _that = this;
switch (_that) {
case _PostDetailsState():
return $default(_that.status,_that.post,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PostDetailsStatus status,  Post? post,  String error)?  $default,) {final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
return $default(_that.status,_that.post,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PostDetailsState implements PostDetailsState {
  const _PostDetailsState({this.status = PostDetailsStatus.initial, this.post, this.error = ''});
  

@override@JsonKey() final  PostDetailsStatus status;
@override final  Post? post;
@override@JsonKey() final  String error;

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDetailsStateCopyWith<_PostDetailsState> get copyWith => __$PostDetailsStateCopyWithImpl<_PostDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.post, post) || other.post == post)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,post,error);

@override
String toString() {
  return 'PostDetailsState(status: $status, post: $post, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PostDetailsStateCopyWith<$Res> implements $PostDetailsStateCopyWith<$Res> {
  factory _$PostDetailsStateCopyWith(_PostDetailsState value, $Res Function(_PostDetailsState) _then) = __$PostDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 PostDetailsStatus status, Post? post, String error
});


@override $PostCopyWith<$Res>? get post;

}
/// @nodoc
class __$PostDetailsStateCopyWithImpl<$Res>
    implements _$PostDetailsStateCopyWith<$Res> {
  __$PostDetailsStateCopyWithImpl(this._self, this._then);

  final _PostDetailsState _self;
  final $Res Function(_PostDetailsState) _then;

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? post = freezed,Object? error = null,}) {
  return _then(_PostDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostDetailsStatus,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
