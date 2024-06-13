import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:com_ramabit_www/menu.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/utility/activityplan.dart';
import 'package:com_ramabit_www/utility/activityeelan.dart';
import 'dart:math';
import 'package:com_ramabit_www/utility/connection.dart';

List imgList = [];
var rng = Random();

class MenuIndex extends StatefulWidget {
  const MenuIndex({super.key});

  @override
  CarouselDemoHome createState() => CarouselDemoHome();
}

class _SalesData {
  _SalesData(this.name, this.mojoodi);

  final String name;
  final double mojoodi;
}

List<_SalesData> data = [];
int id = 1;

final themeMode = ValueNotifier(2);
var isDark = true;
var aaa = rng.nextInt(1000);
//firstpage

class CarouselDemoHome extends State<MenuIndex> {
  List imageSliders = [Container()];
  void initState() {
    _getBanner();
    setState(() {});
    super.initState();
  }

  _getBanner() async {
    imgList = await sendback().get('banner');

    setState(() {});

    imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item['get_image'],
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            item['title'],
                            // 'No. ${imgList.indexOf(item)} image',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.6,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: FloatingActionButton(
                elevation: 10,
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.pushNamed(context, '/chat');
                },
                child: Icon(
                  Icons.support_agent,
                  size: 35,
                ),
                backgroundColor: Colors.cyan,
              ),
            ),
          ),
          appBar: Myappsbar(context),
          drawer: Menu(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                StatefulBuilder(builder: (BuildContext context, setState) {
                  return Container(
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      itemCount: imageSliders.length,
                      itemBuilder: (context, index, realIndex) =>
                          imageSliders[index],
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                SafeArea(
                  child: Container(
                    color: Theme.of(context).hoverColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/addusers1');
                                            debugPrint('Received click');
                                          },
                                          child: const Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .person_add_alt_rounded,
                                                    size: 26,
                                                    color: Color.fromARGB(
                                                        255, 240, 187, 11),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'دعوت',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                          // Text('\n'),

                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/sup');
                                            debugPrint('Received click');
                                          },
                                          child: const Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.support,
                                                    size: 26,
                                                    color: Color.fromARGB(
                                                        255, 240, 187, 11),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'تیکت ها',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                          // Text('\n'),

                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/mymine');
                                            debugPrint('Received click');
                                          },
                                          child: const Column(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Ionicons
                                                        .hardware_chip_outline,
                                                    size: 26,
                                                    color: Color.fromARGB(
                                                        255, 240, 187, 11),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'ماینر',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                          // Text('\n'),

                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/myplans');
                                            debugPrint('Received click');
                                          },
                                          child: const Column(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Ionicons.cube_outline,
                                                    size: 26,
                                                    color: Color.fromARGB(
                                                        255, 240, 187, 11),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'پلن ها',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                          // Text('\n'),

                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            debugPrint('Received click');
                                            Navigator.pushNamed(
                                                context, '/history');
                                          },
                                          child: const Column(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Ionicons.time_outline,
                                                    size: 26,
                                                    color: Color.fromARGB(
                                                        255, 240, 187, 11),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'تاریخچه',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                          // Text('\n'),

                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/profile');
                                            debugPrint('Received click');
                                          },
                                          child: const Column(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    size: 24,
                                                    color: Color.fromARGB(
                                                        255, 240, 187, 11),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'پروفایل',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                          // Text('\n'),

                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        // Container(
                        //   width: 200,
                        //   height: 150,
                        //   child: Text('data'),
                        //   color: Colors.blue[400],

                        // )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'موجودی ها',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: Divider(
                    //     thickness: 0.5,
                    //     color: Colors.grey[400],
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                ////////////////////////////////////////
                activityplansviewState(),
                /////////////////////////////////////////////////
                activityeelanview(),
              ],
            ),
          ),
        ));
  }
}
