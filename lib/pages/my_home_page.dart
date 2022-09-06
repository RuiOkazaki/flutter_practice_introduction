import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('Router'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.link,
                size: 24,
              ),
              label: const Text("hoge")),
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('Drawer'),
        ),
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text('End Drawer'),
        ),
      ),
    );
  }
}
