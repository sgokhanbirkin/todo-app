// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/model/todo_model.dart';

class TodoCRUDMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload Todo
  Future<bool> uploadTodo(TodoModel todo) async {
    try {
      await _firestore.collection('todo').doc(todo.id).set(todo.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Fetch Todo
  Future<List<TodoModel>> getTodos() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('todo').get();
      List<TodoModel> todoList = [];
      for (var doc in snapshot.docs) {
        todoList.add(TodoModel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return todoList;
    } catch (e) {
      return [];
    }
  }

  // Update Todo
  Future<bool> updateTodo(TodoModel todo, TodoModel newTodo) async {
    try {
      await _firestore.collection('todo').doc(todo.id).update(newTodo.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Delete Todo
  Future<bool> deleteTodo(String id) async {
    try {
      await _firestore.collection('todo').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Toggle Todo
  Future<bool> toggleTodo(TodoModel todo) async {
    try {
      await _firestore.collection('todo').doc(todo.id).update({'completed': !todo.completed});
      return true;
    } catch (e) {
      return false;
    }
  }
}
