import 'package:flutter/material.dart';

void main() async => runApp(const MyBar());

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: Image(image: AssetImage('images/logo.png')),

      foregroundColor: const Color.fromARGB(255, 41, 41, 41),
      backgroundColor: const Color.fromARGB(255, 240, 187, 19),
      title: const Text('AppBar Demo'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ],
    );
  }
}
