import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:com_ramabit_www/menu.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/utility/activityplan.dart';
import 'package:com_ramabit_www/utility/activityeelan.dart';

List imgList = [
  // {
  //   "get_image":
  //       'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'title': 'banners1'
  // },
];

class MenuIndex extends StatefulWidget {
  const MenuIndex({super.key});

  @override
  CarouselDemoHome createState() => CarouselDemoHome();
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

final themeMode = ValueNotifier(2);
var isDark = true;

//firstpage

class CarouselDemoHome extends State<MenuIndex> {
  var client = http.Client();
  List imageSliders = [Container()];
  void initState() {
    _getBanner();
    setState(() {});
    super.initState();
  }

  _getBanner() async {
    imgList = [];
    var response = json.decode(utf8.decode((await client.get(
      Uri.parse('https://ryanai.ir/api/v1/banner'),
    ))
        .bodyBytes));
    setState(() {
      imgList = response;
    });

    print(imgList);

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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      void initState() {
        _getBanner();
        setState(() {});
        super.initState();
      }
    });
    return Scaffold(
      appBar: Myappsbar(),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemCount: imageSliders.length,
                itemBuilder: (context, index, realIndex) => imageSliders[index],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SafeArea(
              child: Container(
                color: Theme.of(context).hoverColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .06),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/depos');
                                        debugPrint('Received click');
                                      },
                                      child: const Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Ionicons.log_out_outline,
                                                size: 26,
                                                color: Color.fromARGB(
                                                    255, 240, 187, 11),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'برداشت',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      // Text('\n'),

                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .06),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/charge');
                                        debugPrint('Received click');
                                      },
                                      child: const Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Ionicons.log_in_outline,
                                                size: 26,
                                                color: Color.fromARGB(
                                                    255, 240, 187, 11),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'واریز',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      // Text('\n'),

                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .07),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/mymine');
                                        debugPrint('Received click');
                                      },
                                      child: const Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Ionicons.hardware_chip_outline,
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      // Text('\n'),

                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .06),
                                  child: TextButton(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      // Text('\n'),

                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .06),
                                  child: TextButton(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      // Text('\n'),

                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .06),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/sets');
                                        debugPrint('Received click');
                                      },
                                      child: const Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Ionicons.briefcase_outline,
                                                size: 24,
                                                color: Color.fromARGB(
                                                    255, 240, 187, 11),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'کسب دارمد',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      // Text('\n'),

                                      ),
                                )
                              ],
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'پلن ها',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
