import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';

// Streamのポイント
// データ作成者
//   データを作成したらStreamへ流します
// データ利用者
//   Streamをwatchしており，データが流れてきたら拾います

class StreamPattern extends StatefulWidget {
  const StreamPattern({super.key});

  @override
  State<StreamPattern> createState() => _StreamPatternState();
}

class _StreamPatternState extends State<StreamPattern> {
  int _counter = 0;

  // Streamを宣言
  final _counterStream = StreamController<int>();
  var _consumer;

  @override // Stateを初期化した時にConsumerへデータを流す
  void initState() {
    super.initState();
    _consumer = Consumer(_counterStream);
  }

  @override // unmount時にStreamを削除する
  void dispose() {
    super.dispose();
    _counterStream.close();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _counterStream.sink.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('Stream Pattern'),
      body: Center(
        child: Text(_counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter, child: const Icon(Icons.add)),
    );
  }
}

class Consumer {
  Consumer(StreamController<int> consumeStream) {
    consumeStream.stream.listen((data) async {
      print("consumerが$dataを使用しました．");
    });
  }
}
