import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:provider/provider.dart';

// 本来はFreezedなどを使用する
@immutable
class CounterState {
  // Constructorの引数にcountを設けてる
  const CounterState({required this.count});
  final int count;
}

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(const CounterState(count: 0));

  void increment() => state = CounterState(count: state.count + 1);
  void decrement() => state = CounterState(count: state.count - 1);
  void reset() => state = const CounterState(count: 0);
}

class StateNotifierCounterPage extends StatelessWidget {
  const StateNotifierCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<CounterStateNotifier, CounterState>(
      create: (context) => CounterStateNotifier(),
      child: const _StateNotifierCounterPage(),
    );
  }
}

class _StateNotifierCounterPage extends StatelessWidget {
  const _StateNotifierCounterPage();

  @override
  Widget build(BuildContext context) {
    print('Page rebuild!');

    return Scaffold(
      appBar: genHeader('state notifier'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Consumer<CounterState>(builder: (context, state, _) {
              print('Consumer rebuild!');
              return Text(
                state.count.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => context.read<CounterStateNotifier>().increment(),
              tooltip: 'Increment',
              heroTag: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () => context.read<CounterStateNotifier>().decrement(),
              tooltip: 'Decrement',
              heroTag: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16),
            FloatingActionButton.extended(
              onPressed: () => context.read<CounterStateNotifier>().reset(),
              tooltip: 'Reset',
              heroTag: 'Reset',
              label: const Text('RESET'),
            ),
          ],
        ),
      ),
    );
  }
}
