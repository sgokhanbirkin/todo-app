part of 'todo_crud_cubit.dart';

@immutable
abstract class TodoCrudState {
  static TodoCrudState initial() {
    return TodoListState(todos: const []);
  }
}

class TodoCubitInitial extends TodoCrudState {}

class TodoListState extends TodoCrudState {
  final List<TodoModel> todos;

  TodoListState({required this.todos});
}
