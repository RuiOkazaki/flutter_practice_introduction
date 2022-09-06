import 'package:flutter/material.dart';

AppBar genHeader(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 4,
    // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    // actions: [
    //   IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    //   IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    // ],
  );
}
