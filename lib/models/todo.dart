class Todo {
  final String todo;
  final bool isCompleted;

  Todo({required this.todo, required this.isCompleted});

  Todo copywith({String? todo, bool? isCompleted}) {
    return Todo(
        todo: todo ?? this.todo, isCompleted: isCompleted ?? this.isCompleted);
  }
}
