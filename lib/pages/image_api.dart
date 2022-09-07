import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? _image;
  final imagePicker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) _image = XFile(pickedFile.path);
    });
  }

  Future getImageFromGarally() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) _image = XFile(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('image api'),
      body: Center(
        child: _image == null
            ? const Text('写真を選択してください')
            : Image.file(File(_image!.path)),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: FloatingActionButton(
                onPressed: getImageFromCamera,
                child: const Icon(Icons.photo_camera)),
          ),
          FloatingActionButton(
              onPressed: getImageFromGarally,
              child: const Icon(Icons.photo_album)),
        ],
      ),
    );
  }
}
