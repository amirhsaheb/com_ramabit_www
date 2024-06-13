import 'package:com_ramabit_www/my_button_register_singup.dart';
import 'package:com_ramabit_www/utility/connection.dart';
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
class PageLogin12 extends StatefulWidget {
  PageLogin12({super.key});

  @override
  State<PageLogin12> createState() => _PageLogin1State();
}

class _PageLogin1State extends State<PageLogin12> {
  final forget = TextEditingController();

  // final passwordcontroller = TextEditingController();

  var client = http.Client();
  void initState() {
    setState(() {});
    super.initState();
  }

  _sendrepass() async {
    await sendback().post('users/reset_password/', {'email': forget.text});
    forget.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: Myappsbar(context),
        // drawer: Menu(),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
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
                controller: forget,
                hinttext: 'ایمیل',
                secretpass: false,
              ), //username
              SizedBox(
                height: 10,
              ),
              //password
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //forget password
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //singin buttons
              TextButton(
                onPressed: () {
                  _sendrepass();
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'ارسال',
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
                  children: [],
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/log');
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'بازگشت',
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
    );
  }
}
