import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';

class LifesyclePage extends StatefulWidget {
  const LifesyclePage({Key? key}) : super(key: key);

  @override
  State<LifesyclePage> createState() {
    // print("call createState");
    return _LifesyclePageState();
  }
}

class _LifesyclePageState extends State<LifesyclePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // print("call setState");
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    // print("call initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print("call didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    // print("call build");
    return Scaffold(
      appBar: genHeader('lifesycle'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    // print("call deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    // print("call dispose");
  }
}
