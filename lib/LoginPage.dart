import 'dart:html';

import 'package:com_ramabit_www/my_button_register_singup.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
import 'package:com_ramabit_www/my_button_login_singin.dart';

class PageLogin extends StatelessWidget {
  PageLogin({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void UserSingIn() {}
  void UserSingup() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
            child: Column(children: <Widget>[
              SizedBox(
                height: 30,
              ),
              //LOGO
              Icon(
                color: Color(0xFFFFD700),
                Icons.lock,
                size: 100,
              ),
              SizedBox(
                height: 15,
              ),

              //Wellcome back
              Text(
                'به کایسی خوش آمدید ',
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
                    Text(
                      'فراموشی رمز عبور',
                      style: TextStyle(color: Colors.grey[100], fontSize: 12),
                    ), //forget password
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //singin buttons
              MyButtonSingin(
                onTap: UserSingIn,
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

              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(horizontal: 26),
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
