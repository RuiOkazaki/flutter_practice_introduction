import 'package:flutter/material.dart';

Widget genLink(BuildContext context, String path) {
  return TextButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      icon: const Icon(
        Icons.link,
        size: 24,
      ),
      label: Text(path));
}
