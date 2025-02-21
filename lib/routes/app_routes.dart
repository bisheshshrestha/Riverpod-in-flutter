import 'package:go_router/go_router.dart';
import 'package:riverpod_example/pages/home/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return HomePage();
        })
  ],
);
