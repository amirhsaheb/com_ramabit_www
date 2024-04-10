import 'package:com_ramabit_www/RegisterPage.dart';
import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: library_prefixes
import 'package:com_ramabit_www/page1.dart';
import 'package:com_ramabit_www/menu.dart';
import 'package:com_ramabit_www/LoginPage.dart';
import 'package:com_ramabit_www/activity1.dart';
import 'package:com_ramabit_www/balances.dart';

/// Flutter code sample for [AppBar].

void main() async => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.values.toList()[value],
            initialRoute: '/index',
            routes: {
              '/index': (context) => CarouselDemoHome(),
              '/second': (context) => const FirstScreen(),
              '/balances': (context) => const Balances(),
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
      },
      valueListenable: themeMode,
    );
  }
}
