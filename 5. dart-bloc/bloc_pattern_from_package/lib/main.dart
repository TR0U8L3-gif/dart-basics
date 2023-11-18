import 'package:bloc_pattern_from_package/bloc/counter_bloc.dart';
import 'package:bloc_pattern_from_package/bloc/counter_event.dart';
import 'package:bloc_pattern_from_package/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: _counterBloc,
              builder: ((context, state) => Text(
                      "${state.counter}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
              ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _counterBloc.add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () => _counterBloc.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
