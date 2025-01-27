import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Hello jee'),
          Consumer(
            builder: (context, ref, child) {
              final somejee = ref.watch(dataProvider);
              return Text(somejee);
            },
          )
        ],
      ),
    );
  }
}
