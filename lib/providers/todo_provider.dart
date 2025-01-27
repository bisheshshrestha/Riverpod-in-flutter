import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

final todoProvider = NotifierProvider(() => TodoProvider());

class TodoProvider extends Notifier<List<Todo>> {
  @override
  build() {
    return [Todo(todo: "Get up earling in the morning", isCompleted: false)];
  }
}
