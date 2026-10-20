import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typicode_example/core/di/injection.dart';
import 'package:typicode_example/features/details/presentation/cubit/post_details_cubit.dart';
import 'package:typicode_example/features/posts/data/models/models.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';

@RoutePage()
class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    @PathParam('id') required this.postId,
    this.post,
    super.key,
  });

  final int postId;
  final Post? post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostDetailsCubit(
        getIt<PostsRepository>(),
      )..loadPost(id: postId, initialPost: post),
      child: const PostDetailsView(),
    );
  }
}

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<PostDetailsCubit, PostDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case PostDetailsStatus.initial:
              case PostDetailsStatus.loading:
                return const CircularProgressIndicator();
              case PostDetailsStatus.success:
                return Text('${state.post?.title}');
              case PostDetailsStatus.failure:
                return Text('Error: ${state.error}');
            }
          },
        ),
      ),
    );
  }
}
