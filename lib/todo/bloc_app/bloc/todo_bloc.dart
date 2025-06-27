import 'package:customscreens/todo/bloc_app/events/todo_events.dart';
import 'package:customscreens/todo/bloc_app/state/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksBloc extends Bloc<TaskEvent, TaskState> {
  TasksBloc() : super(TaskInitial()) {
    on<AddTask>((event, emit) {
      final newTasks = List<String>.from(state.tasks)..add(event.title);
      final newCOmpleted = List<bool>.from(state.completed)..add(false);
      emit(
        TaskUpdated(
          newTasks,
          newCOmpleted,
          state.deletedTasks,
          state.taskLength + 1,
        ),
      );
    });

    on<CompletedTask>((event, emit) {
      final newCOmpleted = List<bool>.from(state.completed);
      newCOmpleted[event.index] = true;
      emit(
        TaskUpdated(
          state.tasks,
          newCOmpleted,
          state.deletedTasks,
          state.taskLength,
        ),
      );
    });

    on<DeletedTask>((event, emit) {
      final newTasks = List<String>.from(state.tasks)..removeAt(event.index);
      final newCOmpleted = List<bool>.from(state.completed)
        ..removeAt(event.index);
      emit(
        TaskUpdated(
          newTasks,
          newCOmpleted,
          state.deletedTasks,
          state.taskLength - 1,
        ),
      );
    });
  }
}
