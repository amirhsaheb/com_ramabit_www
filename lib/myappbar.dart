// ignore_for_file: non_constant_identifier_names

import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/material.dart';
// import 'package:com_ramabit_www/node.dart';

Myappsbar() {
  return AppBar(
    title: const Text('KC Investments'),
    actions: [
      IconButton(
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 20,
          ),
          onPressed: () {
            themeMode.value = themeMode.value == 1 ? 2 : 1;
          }),
    ],
  );
}
