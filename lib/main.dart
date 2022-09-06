import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/pages/my_home_page.dart';
import 'package:flutter_practice_introduction/pages/now_loading.dart';
import 'package:flutter_practice_introduction/pages/whats_today.dart';

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
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const MyHomePage(),
        '/whats_today': (BuildContext context) => const WhatsToday(),
        '/now_loading': (BuildContext context) => const NowLoading(),
      },
    );
  }
}
