import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/style.dart';

Widget buildListTile(String title, value, icon) {
  return ListTile(
    contentPadding: const EdgeInsets.all(5),
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    leading: CircleAvatar(backgroundColor: const Color.fromARGB(255, 223, 221, 220), child: Icon(icon)),
    title: Text(
      '$title:',
    ),
    trailing: Text(
      '$value',
      style: ProjectStyle.projectTextStyle,
      textAlign: TextAlign.left,
    ),
  );
}
