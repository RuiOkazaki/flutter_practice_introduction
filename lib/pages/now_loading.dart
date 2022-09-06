import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';

class NowLoading extends StatefulWidget {
  const NowLoading({super.key});

  @override
  State<NowLoading> createState() => _NowLoadingState();
}

class _NowLoadingState extends State<NowLoading> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: genHeader("now loading"),
        body: Column(
          children: [
            TextButton.icon(
              onPressed: _changeState,
              icon: const Icon(Icons.change_circle),
              label: Text('isLoading: $isLoading'),
            ),
            if (isLoading)
              Center(
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 4.0,
                        ),
                      )))
          ],
        ));
  }

  _changeState() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
