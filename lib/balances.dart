import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/menu.dart';

void main() async => runApp(const Balances());

class Balances extends StatelessWidget {
  const Balances({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(),
      drawer: Menu(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}
