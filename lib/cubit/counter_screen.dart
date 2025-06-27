import 'package:customscreens/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Text("Count: $count", style: TextStyle(fontSize: 50));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().decreament(),
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
