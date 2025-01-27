import 'package:riverpod_example/pages/home_page.dart';
import 'package:riverpod_example/routes/route_enum.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) {
        return HomePage();
      },
    )
  ],
);
