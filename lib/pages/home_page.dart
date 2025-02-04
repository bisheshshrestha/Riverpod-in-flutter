import 'package:flutter/material.dart';
import 'package:riverpod_example/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CategoryList(),
        ],
      ),
    );
  }
}
