import 'package:riverpod_example/pages/detail_page.dart';
import 'package:riverpod_example/pages/home_page.dart';
import 'package:riverpod_example/pages/item_list.dart';
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
      routes: [
        GoRoute(
            path: 'item-list/:label',
          name: AppRoute.itemList.name,
          builder: (context, state){
              final label = state.pathParameters['label']!;
              return ItemList(label: label);
          }
        ),
        GoRoute(
            path: 'item-detail/:id',
            name: AppRoute.detail.name,
            builder: (context, state){
              final id = state.pathParameters['id']!;
              return DetailPage(id: id);
            }
        )


      ]
    ),


  ],
);
