import 'package:typicode_example/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:typicode_example/features/posts/data/models/models.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPostById(int id);
}

class PostsRepositoryImpl implements PostsRepository {
  const PostsRepositoryImpl(this._remoteDataSource);

  final PostsRemoteDataSource _remoteDataSource;

  @override
  Future<List<Post>> getPosts() => _remoteDataSource.getPosts();

  @override
  Future<Post> getPostById(int id) => _remoteDataSource.getPostById(id);
}
