import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var username = TextEditingController();
var last_name = TextEditingController();
var name = TextEditingController();
var mobile = TextEditingController();
var email = TextEditingController();

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

class FirstScreen extends State<Menu> {
  var user = {};
  var client = http.Client();
  @override
  void initState() {
    _getUser();

    super.initState();
  }

  _getUser() async {
    var response = json.decode((await client
            .get(Uri.parse('https://ryanai.ir/api/v1/user'), headers: {
      'Authorization': 'Token c2efb7e498d50d0e9f389cfa9a024209001a98c5'
    }))
        .body);
    user = response;
    username.text = response['username'].toString();
    last_name.text = response['lastname'].toString();
    name.text = response['name'].toString();
    mobile.text = response['mobile'].toString();
    email.text = response['email'].toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Ionicons.person_circle,
                          size: 100,
                        )
                      ],
                    ),
                    // Row(
                    //   children: [

                    //   ],
                    // ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Theme.of(context).highlightColor,
                          width: MediaQuery.of(context).size.width - 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          child: Wrap(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        color: Theme.of(context).highlightColor,
                                        child: Text(
                                          'پروفایل',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(children: [
                                          // Image.network(
                                          //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnV1IwVrzKz9JcxCAURqFxa9lnSmqglUo8Jh5d6wlA9w&s',
                                          //   scale: 1.5,
                                          // ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: name,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  label: Text(
                                                    'نام',
                                                    style: TextStyle(
                                                        fontFamily: 'sansir'),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: last_name,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  label: Text(
                                                    'نام خانوادگی',
                                                    style: TextStyle(
                                                        fontFamily: 'sansir'),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: username,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  label: Text(
                                                    'نام کاربری',
                                                    style: TextStyle(
                                                        fontFamily: 'sansir'),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: mobile,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  label: Text(
                                                    'تلفن',
                                                    style: TextStyle(
                                                        fontFamily: 'sansir'),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: email,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  label: Text(
                                                    'ایمیل',
                                                    style: TextStyle(
                                                        fontFamily: 'sansir'),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          // TextButton(
                                          //     style: ButtonStyle(
                                          //         padding:
                                          //             MaterialStateProperty.all(
                                          //                 EdgeInsets.symmetric(
                                          //                     horizontal: 20,
                                          //                     vertical: 0)),
                                          //         backgroundColor:
                                          //             MaterialStateProperty.all(
                                          //                 Colors.green[500]),
                                          //         shape: MaterialStateProperty.all(
                                          //             RoundedRectangleBorder(
                                          //                 borderRadius:
                                          //                     BorderRadius.all(
                                          //                         Radius.circular(
                                          //                             8))))),
                                          //     onPressed: () {},
                                          //     child: Text(
                                          //       'ثبت',
                                          //       style: TextStyle(
                                          //           fontWeight: FontWeight.bold,
                                          //           fontSize: 20),
                                          //     )),
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Theme.of(context).highlightColor,
                          width: MediaQuery.of(context).size.width - 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          child: Wrap(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        color: Colors.red[800]
                                        // ThemeData.dark()
                                        //     .colorScheme
                                        //     .errorContainer
                                        ,
                                        child: Text(
                                          'تغییر رمز عبور',
                                          style: TextStyle(
                                              // color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(children: [
                                          Container(
                                            width: 250,
                                            child: const TextField(
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText: 'رمز عبور فعلی',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 250,
                                            child: const TextField(
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText: 'رمز عبور جدید',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 250,
                                            child: const TextField(
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText:
                                                      'تکرار رمز عبور جدید',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          TextButton(
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 0)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green[500]),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      8))))),
                                              onPressed: () {},
                                              child: Text(
                                                'ثبت',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )),
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Theme.of(context).highlightColor,
                          width: MediaQuery.of(context).size.width - 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          child: Wrap(
                            children: [
                              Column(
                                children: [],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
