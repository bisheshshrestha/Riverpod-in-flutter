import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/routes/app_routes.dart';

// Future<String> getSome() {
//   return Future.delayed(Duration(seconds: 2), () {
//     return 'hello';
//   });
// }

void main() {
  // getSome().then((val) {
  //   print(val);
  // }).catchError((err) {
  //   print(err);
  // });

  runApp(ProviderScope(child: const Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
