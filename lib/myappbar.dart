// ignore_for_file: non_constant_identifier_names

import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/material.dart';
// import 'package:com_ramabit_www/node.dart';

String page = '/profile';

Myappsbar(context) {
  return AppBar(
    title: const Text('Ramabit'),
    actions: [
      Row(
        children: [
          IconButton(
              icon: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                size: 20,
              ),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              }),
          if (ModalRoute.of(context)?.settings.name != page)
            IconButton(
                onPressed: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/profile', (route) => true);
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icon(Icons.person_pin))
        ],
      ),
    ],
  );
}
