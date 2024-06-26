import 'package:flutter/material.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
// import 'package:com_ramabit_www/my_button_login_singin.dart';
import 'package:com_ramabit_www/my_button_register_singup.dart';
import 'package:flutter/widgets.dart';

class PageRegister extends StatelessWidget {
  PageRegister({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();
  final Emailcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();

  // void UserSingup() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
            child: Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              //LOGO
              Icon(
                color: Color(0xFFFFD700),
                Icons.app_registration_rounded,
                size: 50,
              ),

              SizedBox(
                height: 0,
              ),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                        'فرم ثبت نام',
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

              SizedBox(
                height: 15,
              ),

              //Wellcome back
              Text(
                'مرحله اول ثبت نام',
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

              MyTextFeild(
                controller: repasswordcontroller,
                hinttext: 'تکرار رمز عبور',
                secretpass: true,
              ), //password

              SizedBox(
                height: 10,
              ),
              //singin buttons
              MyTextFeild(
                controller: Emailcontroller,
                hinttext: 'ایمیل',
                secretpass: false,
              ), //password

              SizedBox(
                height: 10,
              ),

              MyTextFeild(
                controller: phonenumbercontroller,
                hinttext: 'موبایل',
                secretpass: false,
              ), //password

              SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 15,
              ),

              TextButton(
                onPressed: () => "",
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

              // MyButtonSingup(
              //   onTap: UserSingup,
              // ),

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
