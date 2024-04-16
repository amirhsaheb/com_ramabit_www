import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/menu.dart';
import 'package:flutter/widgets.dart';
//
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/container.dart';

void main() async => runApp(const FirstScreen());

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

int id = 1;

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 10),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40),
      _SalesData('Jan', 10),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];
    return Scaffold(
      appBar: Myappsbar(),
      // drawer: Menu(),
      body: Column(
        children: [
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
          // ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    //////dovomi
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6)),
                                      Row(children: [Text('data')]),
                                      Row(
                                        children: [Text('data')],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  //sevomi
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '10BTC',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [Text(r"$" + '60,000')],
                                    )
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
