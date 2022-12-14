import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/firebase_options.dart';
import 'package:flutter_practice_introduction/pages/animation_widget.dart';
import 'package:flutter_practice_introduction/pages/app_lifesycle_page.dart';
import 'package:flutter_practice_introduction/pages/firebase_storage.dart';
import 'package:flutter_practice_introduction/pages/firestore_page.dart';
import 'package:flutter_practice_introduction/pages/flutter_state_notifier.dart';
import 'package:flutter_practice_introduction/pages/google_signin.dart';
import 'package:flutter_practice_introduction/pages/gps.dart';
import 'package:flutter_practice_introduction/pages/image_api.dart';
import 'package:flutter_practice_introduction/pages/lifesycle_page.dart';
import 'package:flutter_practice_introduction/pages/index.dart';
import 'package:flutter_practice_introduction/pages/now_loading.dart';
import 'package:flutter_practice_introduction/pages/signin_page.dart';
import 'package:flutter_practice_introduction/pages/stream_pattern.dart';
import 'package:flutter_practice_introduction/pages/whats_today.dart';
import 'package:flutter_practice_introduction/pages/whats_day.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/': (BuildContext context) => const Index(),
        '/whats_today': (BuildContext context) => const WhatsToday(),
        '/now_loading': (BuildContext context) => const NowLoading(),
        '/whats_day': (BuildContext context) => const WhatsDay(),
        '/animation_widget': (BuildContext context) => const AnimationWidget(),
        '/image_api': (BuildContext context) => const CameraPage(),
        '/gps': (BuildContext context) => const Gps(),
        '/signin_page': (BuildContext context) => const SigninPage(),
        '/google_signin': (BuildContext context) => const GoogleSignin(),
        '/firestore_page': (BuildContext context) => const FirestorePage(),
        '/firebase_storage_page': (BuildContext context) =>
            const FirebaseStoragePage(),
        '/lifesycle_page': (BuildContext context) => const LifesyclePage(),
        '/app_lifesycle_page': (BuildContext context) =>
            const AppLifesyclePage(),
        '/stream_pattern': (BuildContext context) => const StreamPattern(),
        '/flutter_state_notifier': (BuildContext context) =>
            const StateNotifierCounterPage(),
      },
    );
  }
}
