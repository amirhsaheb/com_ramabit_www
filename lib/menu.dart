// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:com_ramabit_www/main.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

// import 'package:com_ramabit_www/node.dart';

void main() async => runApp(const Menu());

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  MyMenu createState() => MyMenu();
}

class MyMenu extends State<Menu> {
  var client = http.Client();
  var user = '';
  var plansub = false;
  var minesub = false;
  @override
  void initState() {
    _getUser();

    super.initState();
  }

  _getUser() async {
    user = '';
    var response = json.decode((await client
            .get(Uri.parse('https://ryanai.ir/api/v1/user'), headers: {
      'Authorization': 'Token c2efb7e498d50d0e9f389cfa9a024209001a98c5'
    }))
        .body);
    user = response['username'].toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(Status)
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            width: 250,
            backgroundColor: const Color.fromARGB(255, 38, 37, 30),
            child: ListView(children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 16, right: 20),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/man.png')),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 0, right: 10)),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'sansir'),
                                          user),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'sansir'),
                                          "موجودی : 10,000 دلار"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/index');
                                                },
                                                child: const Wrap(children: [
                                                  Icon(
                                                      color: Colors.white,
                                                      Icons.home),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0, right: 10)),
                                                  Text(
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontFamily: 'sansir'),
                                                      'خانه'),
                                                ]))
                                          ]),
                                          // Row(
                                          //   children: [
                                          //     TextButton(
                                          //       onPressed: () {},
                                          //       child: Wrap(
                                          //         children: [
                                          //           Icon(
                                          //               color: Colors.white,
                                          //               Icons.dashboard),
                                          //           Padding(
                                          //               padding:
                                          //                   EdgeInsets.only(
                                          //                       top: 0,
                                          //                       right: 10)),
                                          //           Text(
                                          //               style: TextStyle(
                                          //                   color: Colors.white,
                                          //                   fontSize: 18,
                                          //                   fontFamily:
                                          //                       'sansir'),
                                          //               'داشبورد'),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/profile');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.person),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'اطلاعات کاربری'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (plansub == true) {
                                                      plansub = false;
                                                    } else {
                                                      {
                                                        plansub = true;
                                                      }
                                                    }
                                                  });
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons
                                                            .rectangle_outlined),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'پلن ها'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Builder(builder: (context) {
                                                if (plansub)
                                                  return TextButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context, '/buyplans');
                                                    },
                                                    child: const Wrap(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 0,
                                                                    right: 20)),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 0,
                                                                    right: 10)),
                                                        Text(
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'sansir'),
                                                            'خرید پلن'),
                                                      ],
                                                    ),
                                                  );
                                                return const Wrap();
                                              })
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child:
                                                    Builder(builder: (context) {
                                                  if (plansub)
                                                    return TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/myplans');
                                                      },
                                                      child: const Wrap(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 0,
                                                                      right:
                                                                          20)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 0,
                                                                      right:
                                                                          10)),
                                                          Text(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'sansir'),
                                                              'پلن های من'),
                                                        ],
                                                      ),
                                                    );
                                                  return const Wrap();
                                                }),
                                              )
                                            ],
                                          ),

                                          ////
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (minesub == true) {
                                                      minesub = false;
                                                    } else {
                                                      {
                                                        minesub = true;
                                                      }
                                                    }
                                                  });
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons
                                                            .rectangle_outlined),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'ماینر'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Builder(builder: (context) {
                                                if (minesub)
                                                  return TextButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context, '/buymine');
                                                    },
                                                    child: const Wrap(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 0,
                                                                    right: 20)),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 0,
                                                                    right: 10)),
                                                        Text(
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'sansir'),
                                                            'خرید ماینر'),
                                                      ],
                                                    ),
                                                  );
                                                return const Wrap();
                                              })
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child:
                                                    Builder(builder: (context) {
                                                  if (minesub)
                                                    return TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context, '/mymine');
                                                        ;
                                                      },
                                                      child: const Wrap(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 0,
                                                                      right:
                                                                          20)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 0,
                                                                      right:
                                                                          10)),
                                                          Text(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'sansir'),
                                                              'ماینر های من'),
                                                        ],
                                                      ),
                                                    );
                                                  return const Wrap();
                                                }),
                                              )
                                            ],
                                          ),

                                          ////
                                          Row(children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/balances');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.balance),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'موجودی حساب'),
                                                  ],
                                                ))
                                          ]),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/kasb');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.paid),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'کسب درآمد'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/charge');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons
                                                            .battery_charging_full),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'شاژ حساب'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/depos');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.outbox),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'برداشت'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/history');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons
                                                            .history_toggle_off),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'تاریخچه درآمد ها'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/trans');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.history),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'تراکنش ها'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/sup');
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.support),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'پشتیبانی'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     TextButton(
                                          //       onPressed: () {
                                          //         Navigator.pushNamed(
                                          //             context, '/sets');
                                          //       },
                                          //       child: const Wrap(
                                          //         children: [
                                          //           Icon(
                                          //               color: Colors.white,
                                          //               Icons
                                          //                   .verified_user_outlined),
                                          //           Padding(
                                          //               padding:
                                          //                   EdgeInsets.only(
                                          //                       top: 0,
                                          //                       right: 10)),
                                          //           Text(
                                          //               style: TextStyle(
                                          //                   color: Colors.white,
                                          //                   fontSize: 18,
                                          //                   fontFamily:
                                          //                       'sansir'),
                                          //               'احراز هویت'),
                                          //         ],
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                          const Divider(
                                            color: Color.fromARGB(0, 0, 0, 0),
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  FlutterExitApp.exitApp();
                                                  FlutterExitApp.exitApp(
                                                      iosForceExit: true);
                                                },
                                                child: const Wrap(
                                                  children: [
                                                    Icon(
                                                        color: Colors.white,
                                                        Icons.exit_to_app),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0,
                                                                right: 10)),
                                                    Text(
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'sansir'),
                                                        'خروج'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ])),
      ),
    );
  }
}
