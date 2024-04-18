import 'package:com_ramabit_www/RegisterPage.dart';
import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: library_prefixes
import 'package:com_ramabit_www/balance.dart';
import 'package:com_ramabit_www/LoginPage.dart';
import 'package:com_ramabit_www/balances.dart';
import 'package:com_ramabit_www/profile.dart' as profile;
import 'package:com_ramabit_www/MyPlans.dart' as myplans;
import 'package:com_ramabit_www/buyplans.dart' as buyplans;
import 'package:com_ramabit_www/chargewallet.dart' as chargewallet;
import 'package:com_ramabit_www/deposwallet.dart' as depos;
import 'package:com_ramabit_www/history.dart' as history;
import 'package:com_ramabit_www/transaction.dart' as trans;
import 'package:com_ramabit_www/myloginpage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:com_ramabit_www/plandetails.dart' as detailplan;

// Create storage
final storage = new FlutterSecureStorage();

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
              '/balances/1': (context) => const FirstScreen(),
              '/profile': (context) => const profile.Menu(),
              '/myplans': (context) => const myplans.FirstScreen(),
              '/buyplans': (context) => const buyplans.FirstScreen(),
              '/charge': (context) => const chargewallet.FirstScreen(),
              '/depos': (context) => const depos.FirstScreen(),
              '/history': (context) => const history.FirstScreen(),
              '/trans': (context) => const trans.FirstScreen(),
              '/reg': (context) => PageRegister(),
              '/log': (context) => PageLogin1(),
              '/log2': (context) => PageLogin(),
              '/plandetail': (context) => detailplan.Menu(),
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
