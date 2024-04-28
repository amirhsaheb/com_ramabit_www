import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';

void main() async => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
                    // Row(
                    //   children: [icon
                    //     // Image.asset(
                    //     //   'images/bit.png',
                    //     //   scale: 40,
                    //     // ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'واریز و برداشت',
                    //       style: TextStyle(
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.bold,
                    //           fontFamily: 'sansir.ttf'),
                    //     ),
                    //   ],
                    // ),
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
                                        color: Colors.green,
                                        child: Text(
                                          'ماینر 5 ماهه ',
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
                                          Image.asset(
                                            'images/bit.png',
                                            scale: 20,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            width: 250,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child:
                                                              Text('مبلغ شروع'),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child: Text(
                                                              '011.110101'),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child:
                                                              Text('زمان شروع'),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child: Text(
                                                              '20202.02.2'),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child: Text('دوره'),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child:
                                                              Text('30 روز '),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child:
                                                              Text('درصد سود'),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5) -
                                                              60,
                                                          child: Text('5%'),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 0)),
                                          backgroundColor: MaterialStateProperty
                                              .all(Colors.red[800]),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8))))),
                                      onPressed: () {},
                                      child: Text(
                                        'بستن قرارداد',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
    return FirstScreen();
  }
}
