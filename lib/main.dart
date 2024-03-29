import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
// ignore: library_prefixes
import 'package:com_ramabit_www/page1.dart' as FirstScreen;
import 'package:com_ramabit_www/menu.dart' as menu;

/// Flutter code sample for [AppBar].

void main() async => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const AppBarExample(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (context) => const AppBarExample(),
        },
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale(
            "fa", "IR") // OR Locale('ar', 'AE') OR Other RTL locales,
        );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const menu.Menu(),
      appBar: AppBar(
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
      ),
      body: const FirstScreen.FirstScreen(),
    );
  }
}
