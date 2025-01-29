// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/todo.dart';
//
// final todoProvider =
//     NotifierProvider<TodoProvider, List<Todo>>(() => TodoProvider());
//
// class TodoProvider extends Notifier<List<Todo>> {
//   @override
//   build() {
//     return [Todo(todo: "Get up earling in the morning", isCompleted: false)];
//   }
//
//   void addTodo(Todo todo) {
//     state = [...state, todo];
//     // state.add(todo);
//   }
//
//   void removeTodo(Todo todo) {
//     state.remove(todo);
//     state = [...state];
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

// final todoProvider = NotifierProvider((){
//   return TodoProvider();
// });
final todoProvider =
    NotifierProvider<TodoProvider, List<Todo>>(() => TodoProvider());

class TodoProvider extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [
      Todo(todo: 'hello jee', isCompleted: false),
      Todo(todo: 'hello jee', isCompleted: false),
      Todo(todo: 'hello jee', isCompleted: false),
    ];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(Todo todo) {
    state.remove(todo);
    state = [...state];
  }

  void updateTodo(Todo newTodo, bool val) {
    state = [
      for (final todo in state)
        todo == newTodo ? todo.copywith(isCompleted: val) : todo
    ];
  }
}
