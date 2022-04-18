import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/model/todo_model.dart';
import 'package:todo_app/feature/todoHomePage/service/todo_CRUD_methods.dart';

part 'todo_crud_state.dart';

class TodoCrudCubit extends Cubit<TodoCrudState> {
  TodoCrudCubit() : super(TodoCubitInitial()) {
    _init();
  }
  List<TodoModel>? todoList;
  final TodoCRUDMethods _todoCRUDMethods = TodoCRUDMethods();

  Future<void> _init() async {
    todoList = await _todoCRUDMethods.getTodos();
    emit(TodoListState(todos: todoList ?? []));
  }

  TextEditingController titleController = TextEditingController();

  Future<void> addTodo(String title) async {
    if (title.isNotEmpty) {
      TodoModel todo = TodoModel(
        id: DateTime.now().toString(),
        title: title,
        completed: false,
      );
      _todoCRUDMethods.uploadTodo(todo);
      getTodos();
    } else {}
  }

  Future<void> getTodos() async {
    todoList = await _todoCRUDMethods.getTodos();
    emit(TodoListState(todos: todoList ?? []));
  }

  Future<void> editTodo(String text, TodoModel oldTodo) async {
    if (text.isNotEmpty) {
      TodoModel todo = TodoModel(
        id: oldTodo.id,
        title: text,
        completed: false,
      );
      _todoCRUDMethods.updateTodo(oldTodo, todo);
      getTodos();
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    _todoCRUDMethods.deleteTodo(todo.id);
    getTodos();
  }

  Future<void> toggleTodo(TodoModel todo) async {
    _todoCRUDMethods.toggleTodo(todo);
    getTodos();
  }
}
