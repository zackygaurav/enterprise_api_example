import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:typicode_example/features/posts/data/models/post.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';
import 'package:typicode_example/features/posts/presentation/bloc/posts_bloc.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  late MockPostsRepository mockPostsRepository;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    mockPostsRepository = MockPostsRepository();
  });

  group('PostsBloc', () {
    const mockPost = Post(
      userId: 1,
      id: 1,
      title: 'Test Title',
      body: 'Test Body',
    );

    /// initialState
    test('initial state is correct', () {
      final bloc = PostsBloc(mockPostsRepository);
      expect(
        bloc.state,
        equals(const PostsState(status: .initial)),
      );
    });

    /// successState
    group('PostsFetched', () {
      ///
      blocTest<PostsBloc, PostsState>(
        'emits [loading, success] with posts when fetch succeeds with 200',
        setUp: () {
          when(
            () => mockPostsRepository.getPosts(),
          ).thenAnswer(
            (_) async => [mockPost],
          );
        },
        build: () => PostsBloc(mockPostsRepository),
        act: (bloc) => bloc.add(const PostsEvent.fetched()),
        expect: () => [
          const PostsState(status: .loading),
          const PostsState(status: .success, posts: [mockPost]),
        ],
        verify: (_) {
          verify(
            () => mockPostsRepository.getPosts(),
          ).called(1);
        },
      );

      ///
      blocTest<PostsBloc, PostsState>(
        'emits [loading, failure] when response statusCode is not 200',
        setUp: () {
          when(
            () => mockPostsRepository.getPosts(),
          ).thenThrow(Exception('Failed to fetch posts: 404'));
        },
        build: () => PostsBloc(mockPostsRepository),
        act: (bloc) => bloc.add(const PostsEvent.fetched()),
        expect: () => const <PostsState>[
          PostsState(status: .loading),
          PostsState(
            status: .failure,
            error: 'Exception: Failed to fetch posts: 404',
          ),
        ],
        // verify: (_) => verify(
        //   () => mockHttpClient.get(
        //     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        //   ),
        // ).called(1),
      );

      ///
      blocTest<PostsBloc, PostsState>(
        'emits [loading, failure] when httpClient throws an exception',
        setUp: () {
          when(
            () => mockPostsRepository.getPosts(),
          ).thenThrow(Exception('Connection timed out'));
        },
        build: () => PostsBloc(mockPostsRepository),
        act: (bloc) => bloc.add(const PostsEvent.fetched()),
        expect: () => const [
          PostsState(status: .loading),
          PostsState(
            status: .failure,
            error: 'Exception: Connection timed out',
          ),
        ],
      );
    });
  });
}
