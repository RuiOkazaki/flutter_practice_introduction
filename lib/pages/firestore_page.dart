import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({super.key});

  @override
  State<FirestorePage> createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('firestore'),
      body: Center(
        child: TextButton(
          onPressed: _postData,
          child: const Text("send"),
        ),
      ),
    );
  }

  Future<void> _postData() async {
    FirebaseFirestore.instance
        .collection('collection')
        .doc('document')
        .get()
        .then((ref) {
      print(ref.get("id"));
    });

    FirebaseFirestore.instance.doc('collection/document').set(
      {
        'id': 'a8ceee1e-1017-4e62-8f45-9f09ddb0c295',
        'name': 'rui',
      },
    );
  }
}
