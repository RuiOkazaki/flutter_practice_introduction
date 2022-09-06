import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class WhatsToday extends StatefulWidget {
  const WhatsToday({super.key});

  @override
  State<WhatsToday> createState() => _WhatsTodayState();
}

DateTime now = DateTime.now();
DateFormat outputFormat = DateFormat('MM月dd日');
String date = outputFormat.format(now);

final Uri _url = Uri.parse('https://www.google.com/search?q=$date+何の日');

class _WhatsTodayState extends State<WhatsToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader("whats today"),
      body: TextButton.icon(
          onPressed: _lanchUrl,
          icon: const Icon(Icons.link),
          label: Text('今日は何の日？($date)')),
    );
  }

  Future<void> _lanchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
