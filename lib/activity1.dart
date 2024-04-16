import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:com_ramabit_www/menu.dart';

final List<List> imgList = [
  [
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'banners1'
  ],
  [
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'banners2'
  ],
  [
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    'banners3'
  ],

  // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
];

void main() => runApp(const CarouselDemoHome());

final themeMode = ValueNotifier(2);
var isDark = true;

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key});

  //firstpage
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value],
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
          ],
          locale: const Locale(
              "fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,
          home: const CarouselDemoHome(),
        );
      },
      valueListenable: themeMode,
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    if (themeMode.value == 1) {
      isDark = false;
    } else {
      isDark = true;
    }
    return Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          title: const Text('ThemeMode.system'),
          actions: [
            IconButton(
                icon: Icon(
                  isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                  size: 20,
                ),
                onPressed: () {
                  themeMode.value = themeMode.value == 1 ? 2 : 1;
                }),
          ],
        ),
        body: ComplicatedImageDemo()
        //  ListView(
        //   children: <Widget>[
        //     DemoItem('More complicated image slider', '/complicated'),
        //   ],
        // ),
        );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item[0], fit: BoxFit.cover, width: 1000.0),
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
                        item[1],
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

class ComplicatedImageDemo extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
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
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 210,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.red,
                            child: Image.asset('images/p1.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.blue,
                            child: Image.asset('images/p2.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.green,
                            child: Image.asset('images/p3.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.yellow,
                            child: Image.asset('images/p4.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.orange,
                            child: Image.asset('images/p5.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.orange,
                            child: Image.asset('images/p6.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.orange,
                            child: Image.asset('images/p7.png'),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * .30,
                            // color: Colors.orange,
                            child: Image.asset('images/p8.png'),
                          ),
                        ],

                        // itemCount: products.length,
                      ),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.remove_circle),
                //   onPressed: () {},
                // ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    'اعلان ها',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 0.0,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: const Text(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        // overflow: TextOverflow.values.first,
                                        'قیمت بیت کوین و اتریوم امروز سه‌شنبه'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      height: 65,
                                      child: const Text(
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                          ('امروز در بازار قیمت بیت کوین ریزش را تجربه کرده است و به ۷۱,۲۲۳ (هفتاد و یک هزار و دویست و بیست و سه ) دلار رسید که نسبت به روز قبل ، کاهش ۰.۳۶ درصدی داشته است.'))),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 100,
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrJWR0ndLJ14knzqxlbF5YjIUI_EOBG20XddLkXzjVGw&s',
                                  // scale: 5,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: const Text(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        // overflow: TextOverflow.values.first,
                                        'قیمت بیت کوین و اتریوم امروز سه‌شنبه'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      child: const Text(
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                          // overflow: TextOverflow.fade,
                                          style: TextStyle(fontSize: 10),
                                          ('امروز در بازار قیمت بیت کوین ریزش را تجربه کرده است و به ۷۱,۲۲۳ (هفتاد و یک هزار و دویست و بیست و سه ) دلار رسید که نسبت به روز قبل ، کاهش ۰.۳۶ درصدی داشته است.'))),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 100,
                                child: Image.network(
                                  'https://pbs.twimg.com/profile_images/1724435354910851072/VgcKSi5J_400x400.jpg',
                                  // scale: 5,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: const Text(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        // overflow: TextOverflow.values.first,
                                        'قیمت بیت کوین و اتریوم امروز سه‌شنبه'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      child: const Text(
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                          // overflow: TextOverflow.fade,
                                          style: TextStyle(fontSize: 10),
                                          ('امروز در بازار قیمت بیت کوین ریزش را تجربه کرده است و به ۷۱,۲۲۳ (هفتاد و یک هزار و دویست و بیست و سه ) دلار رسید که نسبت به روز قبل ، کاهش ۰.۳۶ درصدی داشته است.'))),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 100,
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsP9NeKIscFqpdu0HrTmpfrpMmC4YIQ2cxyQ7NhB_eoQ&s',
                                  // scale: 5,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
