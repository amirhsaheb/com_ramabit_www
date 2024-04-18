import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/menu.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
//
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String period = 'all';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

int id = 1;

class FirstScreen extends State<Menu> {
  var plans = [];
  var client = http.Client();
  void initState() {
    _getUser();

    super.initState();
  }

  _getUser() async {
    var response = json.decode(utf8.decode((await client.get(
      Uri.parse('https://ryanai.ir/api/v1/plan-by-currency/1'),
    ))
        .bodyBytes));
    plans = response;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(),
      // drawer: Menu(),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * .19,
                          // color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          period = 'all';
                                        });
                                      },
                                      child: Text(
                                        'همه',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (period == 'all')
                                          ? Colors.green
                                          : Color.fromARGB(255, 42, 42, 42),
                                      border: Border(
                                        left: BorderSide(
                                          // color: Colors.green,
                                          width: 1,
                                        ),
                                      )))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .19,
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          period = '1m';
                                        });
                                      },
                                      child: Text(
                                        '1ماهه',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (period == '1m')
                                          ? Colors.green
                                          : Color.fromARGB(255, 42, 42, 42),
                                      border: Border(
                                        left: BorderSide(
                                          // color: Colors.green,
                                          width: 1,
                                        ),
                                      )))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .19,
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Container(
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          period = '3m';
                                        });
                                      },
                                      child: Text(
                                        '3ماهه',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (period == '3m')
                                          ? Colors.green
                                          : Color.fromARGB(255, 42, 42, 42),
                                      border: Border(
                                        left: BorderSide(
                                          // color: Colors.green,
                                          width: 1,
                                        ),
                                      )))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .19,
                          // color: Colors.yellow,
                          child: Row(
                            children: [
                              Container(
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          period = '6m';
                                        });
                                      },
                                      child: Text(
                                        '6ماهه',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (period == '6m')
                                          ? Colors.green
                                          : Color.fromARGB(255, 42, 42, 42),
                                      border: Border(
                                        left: BorderSide(
                                          // color: Colors.green,
                                          width: 1,
                                        ),
                                      )))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .19,
                          // color: Colors.orange,
                          child: Row(
                            children: [
                              Container(
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          period = '1y';
                                        });
                                      },
                                      child: Text(
                                        'یکساله',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (period == '1y')
                                          ? Colors.green
                                          : Color.fromARGB(255, 42, 42, 42),
                                      border: Border(
                                        left: BorderSide(
                                          // color: Colors.green,
                                          width: 1,
                                        ),
                                      )))
                            ],
                          ),
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
          // Row(
          //   children: [
          //     Container(
          //         child: TextButton(onPressed: () {}, child: Text('همه')),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.green,
          //             border: Border(
          //               left: BorderSide(
          //                 // color: Colors.green,
          //                 width: 1,
          //               ),
          //             )))
          //   ],
          // )
          // ,
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                for (var item in plans)
                  Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(right: 0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/bes/$id');
                        },
                        // padding: EdgeInsets.all(16),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    //avali
                                    children: [
                                      Image.asset(
                                        'images/bit.png',
                                        scale: 50,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 00),
                                            child: Text(
                                              item['title'],
                                              style: TextStyle(
                                                  fontFamily: 'sansir',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            //////dovomi
                                            children: [
                                              Row(children: [Text('سود')]),
                                              Row(
                                                children: [Text('دوره')],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6)),
                                            ],
                                          ),
                                          Column(
                                            //sevomi
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    item['percent'].toString(),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      item['period'].toString())
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          color: Theme.of(context).primaryColorLight,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
