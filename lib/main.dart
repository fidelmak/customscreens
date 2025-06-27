import 'package:customscreens/cubit/counter_cubit.dart';
import 'package:customscreens/cubit/counter_screen.dart';
import 'package:customscreens/demo_screen.dart';
import 'package:customscreens/todo/bloc_app/bloc/todo_bloc.dart';
import 'package:customscreens/todo/bloc_app/views/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (context) => TasksBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom Screens ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
