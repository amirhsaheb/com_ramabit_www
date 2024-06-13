import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';

import 'package:flutter/widgets.dart';
//
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/src/widgets/container.dart';

// class _SalesData {
//   _SalesData(this.year, this.sales);

//   final String year;
//   final double sales;
// }

// int id = 1;

List history = [];

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void initState() {
    _gethisinfo();
  }

  _gethisinfo() async {
    history = await sendback().get('transactions');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // List<_SalesData> data = [
    //   _SalesData('Jan', 10),
    //   _SalesData('Feb', 28),
    //   _SalesData('Mar', 34),
    //   _SalesData('Apr', 32),
    //   _SalesData('May', 40),
    //   _SalesData('Jan', 10),
    //   _SalesData('Feb', 28),
    //   _SalesData('Mar', 34),
    //   _SalesData('Apr', 32),
    //   _SalesData('May', 40)
    // ];
    return Scaffold(
      appBar: Myappsbar(context),
      // drawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in history)
              // Row(
              //   children: [
              //     Container(
              //       color: Theme.of(context).hoverColor,
              //       height: 250,
              //       width: MediaQuery.of(context).size.width,
              //       child: SfCircularChart(
              //         legend: const Legend(isVisible: true),
              //         palette: const [
              //           Colors.red,
              //           Colors.blue,
              //           Colors.amber,
              //           Colors.purple,
              //           Colors.pink,
              //           Colors.orange,
              //           Colors.cyan,
              //           Colors.teal,
              //           Colors.green,
              //           Colors.deepOrangeAccent,
              //           Colors.grey,
              //           Colors.lightBlue,
              //         ],
              //         title: const ChartTitle(
              //             text: 'تاریخچه درآمد ها',
              //             alignment: ChartAlignment.center,
              //             textStyle: TextStyle(fontFamily: 'sansir')),
              //         series: [
              //           DoughnutSeries<_SalesData, String>(
              //             // legendIconType: LegendIconType.circle,
              //             explodeIndex: 1,
              //             dataLabelSettings: DataLabelSettings(isVisible: true),
              //             name: 'موجودی',
              //             dataLabelMapper: (_SalesData data, _) => '',
              //             dataSource: data,
              //             xValueMapper: (_SalesData data, _) => data.year,
              //             yValueMapper: (_SalesData data, _) => data.sales,
              //             radius: '100%',
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(right: 0))),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/history');
                    },
                    // padding: EdgeInsets.all(16),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Image.network(
                                  item[0],
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: Wrap(
                                    children: [
                                      if (item[4] == 'green')
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green[800],
                                          ),
                                        )
                                      else
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Icon(
                                            Icons.arrow_downward,
                                            color: Colors.red[800],
                                          ),
                                        )
                                    ],
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [Text(item[2]), Text(item[5])],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //sevomi
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(
                                              item[1].toString() + item[6])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child:
                                              Text(r"$" + item[8].toString()))
                                    ],
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
              ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(EdgeInsets.only(right: 0))),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/history');
                  },
                  // padding: EdgeInsets.all(16),
                  child: Container(
                    child: Column(
                      children: [],
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
    );
  }
}
