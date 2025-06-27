abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final String title;
  AddTask(this.title);
}

class CompletedTask extends TaskEvent {
  final int index;
  CompletedTask(this.index);
}

class DeletedTask extends TaskEvent {
  final int index;

  DeletedTask({required this.index});
}

class TaskLength extends TaskEvent {
  final int length;
  TaskLength({required this.length});
}
