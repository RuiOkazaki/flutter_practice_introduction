import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';

class AppLifesyclePage extends StatefulWidget {
  const AppLifesyclePage({super.key});

  @override
  State<AppLifesyclePage> createState() => _AppLifesyclePageState();
}

class _AppLifesyclePageState extends State<AppLifesyclePage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("stete = $state");
    switch (state) {
      case AppLifecycleState.inactive:
        print('非アクティブになったときの処理');
        break;
      case AppLifecycleState.paused:
        print('停止されたときの処理');
        break;
      case AppLifecycleState.resumed:
        print('再開されたときの処理');
        break;
      case AppLifecycleState.detached:
        print('破棄されたときの処理');
        break;
    }
  }

  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader("app lifesycle"),
      body: Center(
        child: Text(_counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
