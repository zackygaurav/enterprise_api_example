import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:typicode_example/core/di/injection.dart';
import 'package:typicode_example/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: getIt<AppRouter>().config(
        deepLinkTransformer: (uri) {
          if (uri.host == 'posts') {
            final normalizedPath = uri.path.isEmpty || uri.path == '/'
                ? '/posts'
                : '/posts${uri.path}';

            return SynchronousFuture(uri.replace(path: normalizedPath));
          }

          return SynchronousFuture(uri);
        },
      ),
    );
  }
}
