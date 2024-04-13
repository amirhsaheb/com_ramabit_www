import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';

void main() async => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Myappsbar());
  }
}
