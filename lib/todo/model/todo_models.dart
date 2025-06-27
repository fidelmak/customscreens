import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String task;
  final String description;
  final bool completed;
  final DateTime createdAt;

  Todo({
    String? id,
    required this.task,
    this.description = "",
    this.completed = false,
    DateTime? createdAt,
  }) : id = id ?? Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();
  Todo copyWith({
    String? task,
    String? description,
    bool? completed,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id,
      task: task ?? this.task,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      createdAt: createdAt,
    );
  }
}
