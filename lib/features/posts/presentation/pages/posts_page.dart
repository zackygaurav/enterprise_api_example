import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typicode_example/core/di/injection.dart';
import 'package:typicode_example/core/router/router.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';
import 'package:typicode_example/features/posts/presentation/bloc/posts_bloc.dart';

@RoutePage()
class PostsPage extends StatelessWidget {
  const PostsPage({
    @visibleForTesting this.postsRepository,
    super.key,
  });

  final PostsRepository? postsRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(
        postsRepository ?? getIt<PostsRepository>(),
      )..add(const PostsFetched()),
      child: const PostsView(),
    );
  }
}

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Center(
        child: BlocBuilder<PostsBloc, PostsState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            switch (state.status) {
              case .initial:
              case .loading:
                return const CircularProgressIndicator();
              case .success:
                return _buildContent(state);
              case .failure:
                return Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent(PostsState state) {
    final posts = state.posts;

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          onTap: () => context.pushRoute(
            PostDetailsRoute(post: post, postId: post.id),
          ),
          title: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontWeight: .bold,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text: '${posts[index].id}. ',
                ),
                TextSpan(
                  text: posts[index].title,
                ),
              ],
            ),
          ),
          subtitle: Text(
            posts[index].body,
            textAlign: .start,
            maxLines: 3,
            overflow: .ellipsis,
            softWrap: true,
          ),
        );
      },
    );
  }
}
