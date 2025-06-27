import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  final List<String> tasks;
  final List<bool> completed;
  List<String> deletedTasks = [];
  int taskLength = 0;

  TaskState(this.tasks, this.completed, this.deletedTasks, this.taskLength);

  @override
  List<Object> get props => [tasks, completed];
}

class TaskInitial extends TaskState {
  TaskInitial() : super([], [], [], 0);
}

class TaskUpdated extends TaskState {
  TaskUpdated(
    List<String> tasks,
    List<bool> completed,
    List<String> deletedTasks,
    int taskLength,
  ) : super(tasks, completed, deletedTasks, taskLength);
}
