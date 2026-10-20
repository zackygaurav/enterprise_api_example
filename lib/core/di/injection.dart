import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:typicode_example/core/router/app_router.dart';
import 'package:typicode_example/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:typicode_example/features/posts/data/repositories/posts_repository.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    /// Core
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerLazySingleton<http.Client>(http.Client.new)
    /// Posts Data Source
    ..registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSourceImpl(httpClient: getIt<http.Client>()),
    )
    /// Posts Repository
    ..registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(getIt<PostsRemoteDataSource>()),
    );
}
