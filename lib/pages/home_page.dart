import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/providers/provider.dart';
import 'package:riverpod_example/providers/todo_provider.dart';
import 'package:riverpod_example/widgets/input_widget.dart';
import 'package:riverpod_example/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputWidget(),
          const SizedBox(
            height: 20,
          ),
          const TodoList(),
        ],
      ),
    );
  }
}
