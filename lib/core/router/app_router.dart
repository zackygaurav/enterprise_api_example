import 'package:auto_route/auto_route.dart';
import 'package:typicode_example/core/router/app_router.gr.dart';

/// Replaced gr.dart with "import 'package:typicode_example/core/router/app_router.gr.dart'"
// part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/posts',
      page: PostsRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/posts/:id',
      page: PostDetailsRoute.page,
    ),
  ];
}
