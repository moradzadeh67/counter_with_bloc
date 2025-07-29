import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterInitial) {
                    return Text(
                      '${state.counter}',
                      style: TextStyle(fontSize: 60),
                    );
                  }
                  if (state is UpdatedCounter) {
                    return Text(
                      '${state.counter}',
                      style: TextStyle(fontSize: 60),
                    );
                  }
                  return Text('Error', style: TextStyle(fontSize: 60));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterDecrement());
                },
                child: Text('-', style: TextStyle(fontSize: 30)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
                },
                child: Text('+', style: TextStyle(fontSize: 30)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterReset());
                },
                child: Text('Reset', style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
