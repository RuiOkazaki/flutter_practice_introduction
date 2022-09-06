import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class WhatsDay extends StatefulWidget {
  const WhatsDay({super.key});

  @override
  State<WhatsDay> createState() => _WhatsTodayState();
}

DateTime now = DateTime.now();
DateFormat outputFormat = DateFormat('MM月dd日');

Uri genUri(String date) =>
    Uri.parse('https://www.google.com/search?q=$date+何の日');

class _WhatsTodayState extends State<WhatsDay> {
  String _date = outputFormat.format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader("whats day"),
      body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _date,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Column(children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 50)),
                      onPressed: _lanchUrl,
                      child: const Text(
                        '何の日かを確認する',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8),
                      )),
                  TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 1, 1),
                            maxTime: DateTime(2100, 1, 1),
                            locale: LocaleType.jp,
                            currentTime: now, onConfirm: (date) {
                          setState(() {
                            _date = outputFormat.format(date);
                          });
                        });
                      },
                      child: const Text(
                        "日付を変更する",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ]),
              ],
            ),
          )),
    );
  }

  Future<void> _lanchUrl() async {
    if (!await launchUrl(genUri(_date))) {
      throw 'Could not launch $genUri(_date)';
    }
  }
}
