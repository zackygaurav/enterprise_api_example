import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:typicode_example/features/posts/data/models/post.dart';
import 'package:typicode_example/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:typicode_example/features/posts/presentation/pages/posts_page.dart';

class MockPostsBloc extends MockBloc<PostsEvent, PostsState>
    implements PostsBloc {}

void main() {
  group('PostsView Golden Tests', () {
    late MockPostsBloc mockPostsBloc;

    setUp(() {
      mockPostsBloc = MockPostsBloc();
    });

    /// Helper widget to wrap the view with BlocProvider and phone screen
    /// constraints.
    Widget buildHarness(PostsState state) {
      when(() => mockPostsBloc.state).thenReturn(state);

      return SizedBox(
        width: 375,
        height: 667, // Standard iPhone SE / Compact mobile dimensions
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: BlocProvider<PostsBloc>.value(
            value: mockPostsBloc,
            child: const PostsView(),
          ),
        ),
      );
    }

    ///
    goldenTest(
      'renders all visual states correctly',
      fileName: 'posts_view_states',
      builder: () => GoldenTestGroup(
        columns: 2,
        children: [
          GoldenTestScenario(
            name: 'Loading State',
            child: buildHarness(const PostsState(status: .loading)),
          ),
          GoldenTestScenario(
            name: 'Failure State',
            child: buildHarness(
              const PostsState(
                status: .failure,
                error: 'Failed to fetch posts. Please check your connection.',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Success State',
            child: buildHarness(
              const PostsState(
                status: .success,
                posts: [
                  Post(
                    userId: 1,
                    id: 1,
                    title: 'Understanding Clean Architecture in Flutter',
                    body: '''
                          Clean architecture separates software into layers 
                          to make code testable, maintainable, and independent of frameworks.
                        ''',
                  ),
                  Post(
                    userId: 1,
                    id: 2,
                    title: 'State Management with Bloc',
                    body: '''
                      Bloc pattern helps manage complex states predictively through 
                      unidirectional data flow using streams.
                    ''',
                  ),
                ],
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Success State - Empty',
            child: buildHarness(
              const PostsState(
                status: .success,
                posts: [],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
