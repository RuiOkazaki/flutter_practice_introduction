import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseStoragePage extends StatefulWidget {
  const FirebaseStoragePage({super.key});

  @override
  State<FirebaseStoragePage> createState() => _FirebaseStoragePageState();
}

class _FirebaseStoragePageState extends State<FirebaseStoragePage> {
  Image? _img;
  Text? _text;

  Future<void> _download() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference imageRef =
        storage.ref().child("DL").child('large-c-black-square.jpg');
    String imageUrl = await imageRef.getDownloadURL();

    Reference textRef = storage.ref().child('DL').child('readme.txt');
    var data = await textRef.getData();

    setState(() {
      _img = Image.network(imageUrl);
      _text = Text(ascii.decode(data!));
    });

    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/large-c-black-square.jpg');

    try {
      await imageRef.writeToFile(downloadToFile);
    } catch (e) {
      print(e);
    }
  }

  void _upload() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    File file = File(pickedFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      await storage.ref("UL/upload-pic.png").putFile(file);
      setState(() {
        _text = const Text("UploadDone");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader("firebase storage"),
      body: Center(
        child: Column(
          children: [
            if (_img != null) _img!,
            if (_text != null) _text!,
          ],
        ),
      ),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton(
          heroTag: 'upload img',
          onPressed: _upload,
          child: const Icon(Icons.upload),
        ),
        FloatingActionButton(
          heroTag: 'download',
          onPressed: _download,
          child: const Icon(Icons.download),
        ),
      ]),
    );
  }
}
