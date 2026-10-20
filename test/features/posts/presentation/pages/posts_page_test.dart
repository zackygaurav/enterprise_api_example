import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:typicode_example/features/posts/data/models/post.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';
import 'package:typicode_example/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:typicode_example/features/posts/presentation/pages/posts_page.dart';

class MockPostsBloc extends MockBloc<PostsEvent, PostsState>
    implements PostsBloc {}

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  testWidgets('PostsPage renders PostsView', (tester) async {
    final mockPostsRepository = MockPostsRepository();
    when(
      () => mockPostsRepository.getPosts(),
    ).thenAnswer((_) async => []);

    await tester.pumpWidget(
      MaterialApp(
        home: PostsPage(
          postsRepository: mockPostsRepository,
        ),
      ),
    );

    expect(find.byType(PostsView), findsOneWidget);
  });

  testWidgets(
    'renders AppBar with Posts title',
    (
      tester,
    ) async {
      final postsBloc = MockPostsBloc();
      when(() => postsBloc.state).thenReturn(const PostsState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<PostsBloc>.value(
            value: postsBloc,
            child: const PostsView(),
          ),
        ),
      );

      final appBarFinder = find.byType(AppBar);

      expect(
        find.descendant(of: appBarFinder, matching: find.text('Posts')),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders empty ListView when posts list is empty',
    (tester) async {
      final postsBloc = MockPostsBloc();
      when(
        () => postsBloc.state,
      ).thenReturn(
        const PostsState(status: .success, posts: []),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<PostsBloc>.value(
            value: postsBloc,
            child: const PostsView(),
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    },
  );

  testWidgets(
    'shows CircularProgressIndicator while loading and then list is loaded',
    (tester) async {
      final postsBloc = MockPostsBloc();
      final statesController = StreamController<PostsState>();

      const mockPosts = [
        Post(userId: 1, id: 1, title: 'First Post', body: 'First Body'),
        Post(userId: 2, id: 1, title: 'Second Post', body: 'Second Body'),
      ];

      whenListen(
        postsBloc,
        statesController.stream,
        initialState: const PostsState(status: .loading),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<PostsBloc>.value(
            value: postsBloc,
            child: const PostsView(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ListView), findsNothing);

      statesController.add(
        const PostsState(
          status: .success,
          posts: mockPosts,
        ),
      );

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('First Body'), findsOneWidget);
      expect(find.text('Second Body'), findsOneWidget);

      await statesController.close();
    },
  );

  testWidgets(
    'renders Post ID and title in Richtext correctly',
    (tester) async {
      final postsBloc = MockPostsBloc();
      when(() => postsBloc.state).thenReturn(
        const PostsState(
          status: .success,
          posts: [
            Post(userId: 1, id: 42, title: 'Clean Arch', body: 'Sample body'),
          ],
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<PostsBloc>.value(
            value: postsBloc,
            child: const PostsView(),
          ),
        ),
      );

      expect(
        find.text('42. Clean Arch', findRichText: true),
        findsOneWidget,
      );
    },
  );

  testWidgets('renders failure text with red color', (tester) async {
    final postsBloc = MockPostsBloc();
    const errorMessage = 'Failed to load posts';

    when(() => postsBloc.state).thenReturn(
      const PostsState(
        status: .failure,
        error: errorMessage,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<PostsBloc>.value(
          value: postsBloc,
          child: const PostsView(),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text(errorMessage));
    expect(textWidget.style?.color, Colors.red);
  });

  testWidgets(
    '''
      shows CircularProgressIndicator while loading and then triggers failure state
    ''',
    (tester) async {
      final postsBloc = MockPostsBloc();
      final statesController = StreamController<PostsState>();
      const errorMessage = 'Something went wrong';

      whenListen(
        postsBloc,
        statesController.stream,
        initialState: const PostsState(status: .loading),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<PostsBloc>.value(
            value: postsBloc,
            child: const PostsView(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(errorMessage), findsNothing);
      expect(find.byType(ListView), findsNothing);

      statesController.add(
        const PostsState(
          status: .failure,
          error: errorMessage,
        ),
      );

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListView), findsNothing);
      expect(find.text(errorMessage), findsOneWidget);

      await statesController.close();
    },
  );
}
