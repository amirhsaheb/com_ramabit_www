import 'package:com_ramabit_www/RegisterPage.dart';
import 'package:com_ramabit_www/activity1.dart' as index;
import 'package:com_ramabit_www/activity1.dart';
import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
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
import 'package:com_ramabit_www/empty.dart' as empty;
import 'package:device_preview/device_preview.dart';
import 'package:com_ramabit_www/singleplan.dart';
import 'package:com_ramabit_www/singlemine.dart';
import 'package:com_ramabit_www/forgetpass.dart' as forget;
import 'package:com_ramabit_www/chat.dart';
import 'package:com_ramabit_www/chatsupport.dart';
import 'package:com_ramabit_www/addticket.dart' as addticket;
import 'package:com_ramabit_www/emptycopy.dart';

Map<String, String> headers = {};
String chaturi = '';
var aa = '';
// Create storage
final storage = new FlutterSecureStorage();
var res;
String chatuser = '';

/// Flutter code sample for [AppBar].

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (await storage.read(key: 'token') == null) {
    storage.write(key: 'token', value: '');
  }
  aa = await storage.read(key: 'token') as String;
  headers = {'Authorization': "Token " + aa};
  runApp(AppBarApp());
}

class AppBarApp extends StatefulWidget {
  const AppBarApp({super.key});

  @override
  State<AppBarApp> createState() => _AppBarAppState();
}

class _AppBarAppState extends State<AppBarApp> {
  void initState() {
    _getuser();
    super.initState();
  }

  _getuser() async {
    res = await sendback().post('chats/user', null);
    if (res['uri'] != null) {
      chaturi = res['uri'];
      chatuser = res['username'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.values.toList()[value],
            initialRoute: aa == '' ? '/empty' : '/index', /////empty || index
            routes: {
              '/index': (context) => const index.MenuIndex(),
              '/second': (context) => const FirstScreen(),
              '/balances': (context) => const Balances(),
              '/balance': (context) => const FirstScreen(),
              '/profile': (context) => const profile.Menu(),
              '/myplans': (context) => const myplans.FirstScreen(),
              '/buyplans': (context) => const buyplans.Menu(),
              '/charge': (context) => const chargewallet.FirstScreen(),
              '/singleplan': (context) => singleplans(),
              '/singlemine': (context) => singlemine(),
              '/depos': (context) => const depos.FirstScreen(),
              '/history': (context) => const history.FirstScreen(),
              '/trans': (context) => const trans.FirstScreen(),
              '/reg': (context) => PageRegister(),
              '/log': (context) => PageLogin1(),
              // '/log2': (context) => PageLogin(),
              '/plandetail': (context) => detailplan.Menu(),
              '/buymine': (context) => buymine.Menu(),
              '/mymine': (context) => mymine.FirstScreen(),
              '/kasb': (context) => const kasb.kasby(),
              '/sup': (context) => const supp.kasby(),
              '/sets': (context) => const sets.kasby(),
              '/empty': (context) => empty.PageLogin1(),
              '/forget': (context) => forget.PageLogin12(),
              '/chat': (context) => chat(),
              '/chatsup': (context) => chatsup(),
              '/addticket': (context) => addticket.ticketadd(),
              '/addusers1': (context) => adusers1(),
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
