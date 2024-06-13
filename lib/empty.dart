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

// ignore: must_be_immutable
class PageLogin1 extends StatelessWidget {
  PageLogin1({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var client = http.Client();
  // ignore: non_constant_identifier_names
  void UserSingIn() async {
    var response = json.decode((await client.post(
            Uri.parse('https://www.ramabit.com/api/v1/token/login'),
            body: {
          'username': usernamecontroller.value.text,
          'password': passwordcontroller.value.text
        }))
        .body);
    token = response['auth_token'];
    storage.write(key: 'token', value: token);
  }

  void UserSingup() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: Myappsbar(context),
        // drawer: Menu(),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage('images/handinvest.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.4),
              ),
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
                      shadows: [
                        Shadow(
                          color: Colors.black, // Choose the color of the shadow
                          blurRadius:
                              2.0, // Adjust the blur radius for the shadow effect
                          offset: Offset(2,
                              2), // Set the horizontal and vertical offset for the shadow
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 60,
                ),

                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صجود طراحی اساسا مورد استفاده قرار گیرد.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),

                Spacer(),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 27),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         'فراموشی رمز عبور',
                //         style: TextStyle(color: Colors.grey[100], fontSize: 12),
                //       ), //forget password
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/log');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.amber),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)))),
                        elevation: MaterialStatePropertyAll(5.0)),
                    child: Text(
                      'ورود | ثبت نام',
                      style: TextStyle(fontSize: 18),
                    )),

                //singin buttons
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     padding: const EdgeInsets.all(10.0),
                //     margin: const EdgeInsets.symmetric(horizontal: 26),
                //     decoration: BoxDecoration(
                //         color: Color(0xFFFFD700),
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Center(
                //       child: Text(
                //         'ورود | ثبت نام',
                //         style: TextStyle(
                //             color: Colors.grey[800],
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             fontFamily: 'arial'),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 10,
                ),

                // Padding(
                //   padding: const EdgeInsets.all(1.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           'اگر هنوز ثبت نام نکردی',
                //           style: TextStyle(color: Colors.grey[100]),
                //         ),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(
                  height: 15,
                ),

                // TextButton(
                //   onPressed: () => "",
                //   child: Container(
                //     padding: const EdgeInsets.all(5.0),
                //     margin: const EdgeInsets.symmetric(horizontal: 12),
                //     decoration: BoxDecoration(
                //         color: Color(0xFFFFD700),
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Center(
                //       child: Text(
                //         'ثبت نام',
                //         style: TextStyle(
                //             color: Colors.grey[800],
                //             fontWeight: FontWeight.bold,
                //             fontSize: 25),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 40,
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
}
