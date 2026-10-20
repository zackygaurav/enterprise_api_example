// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:typicode_example/features/details/presentation/pages/post_details_page.dart'
    as _i1;
import 'package:typicode_example/features/posts/data/models/models.dart' as _i4;
import 'package:typicode_example/features/posts/presentation/pages/posts_page.dart'
    as _i2;

/// generated route for
/// [_i1.PostDetailsPage]
class PostDetailsRoute extends _i3.PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    required int postId,
    _i4.Post? post,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         PostDetailsRoute.name,
         args: PostDetailsRouteArgs(postId: postId, post: post, key: key),
         rawPathParams: {'id': postId},
         initialChildren: children,
       );

  static const String name = 'PostDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PostDetailsRouteArgs>(
        orElse: () => PostDetailsRouteArgs(postId: pathParams.getInt('id')),
      );
      return _i1.PostDetailsPage(
        postId: args.postId,
        post: args.post,
        key: args.key,
      );
    },
  );
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({required this.postId, this.post, this.key});

  final int postId;

  final _i4.Post? post;

  final _i5.Key? key;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{postId: $postId, post: $post, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostDetailsRouteArgs) return false;
    return postId == other.postId && post == other.post && key == other.key;
  }

  @override
  int get hashCode => postId.hashCode ^ post.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i2.PostsPage]
class PostsRoute extends _i3.PageRouteInfo<void> {
  const PostsRoute({List<_i3.PageRouteInfo>? children})
    : super(PostsRoute.name, initialChildren: children);

  static const String name = 'PostsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.PostsPage();
    },
  );
}
