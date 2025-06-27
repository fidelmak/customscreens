import 'package:customscreens/todo/bloc_app/events/todo_events.dart';
import 'package:customscreens/todo/bloc_app/state/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:customscreens/todo/bloc_app/bloc/todo_bloc.dart'; // Import TaskBloc

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String taskTitle = '';
              return AlertDialog(
                title: Text('Add Task'),
                content: TextField(
                  onChanged: (value) {
                    taskTitle = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter task title'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (taskTitle.isNotEmpty) {
                        context.read<TasksBloc>().add(AddTask(taskTitle));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      appBar: AppBar(title: Text('Task App')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              BlocBuilder<TasksBloc, TaskState>(
                builder: (context, any) {
                  return Center(
                    child: Text(
                      'Total Task is  ${any.taskLength}',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),

              Center(
                child: BlocBuilder<TasksBloc, TaskState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(state.completed[index] ? '✔️' : '❌'),
                          title: Text(state.tasks[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              context.read<TasksBloc>().add(
                                DeletedTask(index: index),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
