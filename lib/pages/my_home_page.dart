import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:flutter_practice_introduction/components/link.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('Router'),
      body: ListView(
        children: <Widget>[
          genLink(context, "/whats_today"),
          genLink(context, "/now_loading"),
          genLink(context, "/whats_day"),
          genLink(context, "/animation_widget"),
          genLink(context, "/image_api"),
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
