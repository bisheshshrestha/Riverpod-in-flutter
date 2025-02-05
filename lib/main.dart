import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/routes/app_routes.dart';




//provider, notifier provider, future provider, async_notifier provider,  stream provider




void main (){
//   final m =  {
//     'i1': 'salt',
//     'i2': 'pepper',
//     'i3': '',
//     'i4': 'honey',
//     'i5': '',
//     'label': 'fish'
//   };
// List<String> ingres = [];
//   for(final k in m.keys){
//     if(k.startsWith('i')){
//       final data = m[k] as String;
//       if(data.trim().isNotEmpty){
//         ingres.add(data);
//       }
//     }
//
//   }
//   print(ingres);

  runApp(ProviderScope(child: Main()));
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
