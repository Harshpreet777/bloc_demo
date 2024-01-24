import 'package:bloc_task/bloc/counter_bloc.dart';
import 'package:bloc_task/bloc/counter_event.dart';
import 'package:bloc_task/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build call');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "Bloc Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if (state is InitialState) {
            return counterBuild(context, 0);
          }
          if (state is UpdateStates) {
            return counterBuild(context, state.counter);
          }
          return Container();
        },
      ),
    );
  }
}

Widget counterBuild(BuildContext context, int counter) {
  debugPrint('CounterBuild call');
  debugPrint('$counter');
  return Center(
    child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          counter.toString(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberIncreamentEvent());
                },
                child: const Text(
                  'Increament',
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberDecreamentEvent());
                },
                child: const Text(
                  'Decreament',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )
      ],
    ),
  );
}
