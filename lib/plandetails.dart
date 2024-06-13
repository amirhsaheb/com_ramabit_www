// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';

import 'package:com_ramabit_www/activity1.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
import 'package:com_ramabit_www/myappbar.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

enum SingingCharacter { wallet, plan }

class FirstScreen extends State<Menu> {
  // final passwordcontroller = TextEditingController();
  SingingCharacter? _character = SingingCharacter.wallet;
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
                                          'پلن 5 ماهه بیت کوین',
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
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.69,
                                                            child: MyTextFeild(
                                                              hinttext: 'مبلغ',
                                                              secretpass: false,
                                                              numb:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // Text(_character.toString()),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height: 35,
                                                      padding: EdgeInsets.only(
                                                        right: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                      ),
                                                      child: Radio(
                                                          value:
                                                              SingingCharacter
                                                                  .wallet,
                                                          groupValue:
                                                              _character,
                                                          onChanged:
                                                              (SingingCharacter?
                                                                  value) {
                                                            setState(() {
                                                              _character =
                                                                  value;
                                                            });
                                                          }),
                                                    ),
                                                    Text(
                                                      'اضافه شدن سود به پلن',
                                                      style: TextStyle(
                                                          fontFamily: 'sansir'),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height: 20,
                                                      padding: EdgeInsets.only(
                                                        right: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                      ),
                                                      child: Radio(
                                                          value:
                                                              SingingCharacter
                                                                  .plan,
                                                          groupValue:
                                                              _character,
                                                          onChanged:
                                                              (SingingCharacter?
                                                                  value) {
                                                            setState(() {
                                                              _character =
                                                                  value;
                                                            });
                                                          }),
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.right,
                                                      'اصافه شدن به کیف پول',
                                                      style: TextStyle(
                                                          fontFamily: 'sansir'),
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
                                              .all(Colors.green[600]),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8))))),
                                      onPressed: () {},
                                      child: Text(
                                        'خرید پلن',
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
  }
}
