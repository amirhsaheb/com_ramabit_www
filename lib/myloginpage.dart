import 'package:com_ramabit_www/my_button_register_singup.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
import 'package:com_ramabit_www/my_button_login_singin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:com_ramabit_www/main.dart';
import 'package:com_ramabit_www/menu.dart';
import 'package:com_ramabit_www/myappbar.dart';

var token = 'aaa';
var token1 = 'aaa';

// ignore: must_be_immutable
class PageLogin1 extends StatefulWidget {
  PageLogin1({super.key});

  @override
  State<PageLogin1> createState() => _PageLogin1State();
}

class _PageLogin1State extends State<PageLogin1> {
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  var client = http.Client();
  void initState() {
    setState(() {});
    super.initState();
  }

  // ignore: non_constant_identifier_names
  void UserSingIn(context) async {
    var response = json.decode((await client.post(
            Uri.parse('https://www.ramabit.com/api/v1/token/login'),
            body: {
          'username': usernamecontroller.value.text,
          'password': passwordcontroller.value.text
        }))
        .body);
    if (response['auth_token'] == null) {
      showAlertDialog(context, 'نام کاربری یا کلمه عبور اشتباه است');
      return;
    }

    token = response['auth_token'];
    storage.write(key: 'token', value: token);
    headers = {'Authorization': "Token " + token};
    showAlertDialog(context, 'با موفقیت انجام شد');
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, '/index');
    });
  }

  void UserSingup() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: Myappsbar(context),
        // drawer: Menu(),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                //LOGO
                Container(
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(70, 67, 68, 68),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFD700),
                          blurRadius: 100,
                          offset: Offset(4, 8),
                        )
                      ]),
                  child: Image.asset(
                    'images/imagel.png',
                    height: 90,
                  ),
                ),

                // Icon(
                //   color: Color(0xFFFFD700),
                //   Icons.lock,
                //   size: 100,
                // ),
                SizedBox(
                  height: 15,
                ),
                //Wellcome back
                Text(
                  'به رامابیت خوش آمدید ',
                  style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                MyTextFeild(
                  controller: usernamecontroller,
                  hinttext: 'نام کاربری',
                  secretpass: false,
                ), //username
                SizedBox(
                  height: 10,
                ),
                MyTextFeild(
                  controller: passwordcontroller,
                  hinttext: 'رمز عبور',
                  secretpass: true,
                ), //password
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forget');
                        },
                        child: Text(
                          'فراموشی رمز عبور',
                          style:
                              TextStyle(color: Colors.grey[100], fontSize: 12),
                        ),
                      ), //forget password
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //singin buttons
                TextButton(
                  onPressed: () {
                    UserSingIn(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'ورود',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'اگر هنوز ثبت نام نکردی',
                          style: TextStyle(color: Colors.grey[100]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/reg');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'ثبت نام',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       "images/gmail.webp",
                //       height: 72,
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Image.asset(
                //       "images/apple.png",
                //       height: 72,
                //     )
                //   ],
                // )

                // or continu whith

                // google + apple

                // not a member ? register
              ]),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, result) {
    // set up the button
    // Widget okButton = TextButton(
    //   child: Text("OK"),
    //   onPressed: () {},
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("نتیجه"),
      content: Text(result),
      // actions: [
      //   // okButton,
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
