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
import 'package:com_ramabit_www/plandetails.dart' as detailplan;
import 'package:com_ramabit_www/Mymine.dart' as mymine;
import 'package:com_ramabit_www/buymine.dart' as buymine;
import 'package:com_ramabit_www/myloginpage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:com_ramabit_www/kasb.dart' as kasb;
import 'package:com_ramabit_www/support.dart' as supp;
import 'package:com_ramabit_www/sets.dart' as sets;
import 'package:device_preview/device_preview.dart';

// Create storage
final storage = new FlutterSecureStorage();

/// Flutter code sample for [AppBar].

void main() async => runApp(DevicePreview(builder: (context) => AppBarApp()));

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.values.toList()[value],
            initialRoute: '/buymine',
            routes: {
              '/index': (context) => CarouselDemoHome(),
              '/second': (context) => const FirstScreen(),
              '/balances': (context) => const Balances(),
              '/balances/1': (context) => const FirstScreen(),
              '/profile': (context) => const profile.Menu(),
              '/myplans': (context) => const myplans.FirstScreen(),
              '/buyplans': (context) => const buyplans.Menu(),
              '/charge': (context) => const chargewallet.FirstScreen(),
              '/depos': (context) => const depos.FirstScreen(),
              '/history': (context) => const history.FirstScreen(),
              '/trans': (context) => const trans.FirstScreen(),
              '/reg': (context) => PageRegister(),
              '/log': (context) => PageLogin1(),
              '/log2': (context) => PageLogin(),
              '/plandetail': (context) => detailplan.Menu(),
              '/buymine': (context) => buymine.Menu(),
              '/mymine': (context) => mymine.FirstScreen(),
              '/kasb': (context) => const kasb.kasby(),
              '/sup': (context) => const supp.kasby(),
              '/sets': (context) => const sets.kasby(),
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
