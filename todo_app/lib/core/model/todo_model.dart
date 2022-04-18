import 'dart:convert';

class TodoModel {
  String id;
  String title;
  bool completed;

  TodoModel({
    required this.id,
    required this.title,
    required this.completed,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source));
}
