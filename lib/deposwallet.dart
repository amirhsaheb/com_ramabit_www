import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:ionicons/ionicons.dart';

void main() async => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
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
                          Ionicons.wallet_outline,
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
                                          'برداشت',
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
                                            child: const TextField(
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText: 'مبلغ واریزی',
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
                                            child: const TextField(
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText: 'انتخاب کیف پول',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
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
                                          ' کد تاید ایمیل',
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
    return FirstScreen();
  }
}
