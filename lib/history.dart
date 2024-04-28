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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Theme.of(context).hoverColor,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: SfCircularChart(
                    legend: const Legend(isVisible: true),
                    palette: const [
                      Colors.red,
                      Colors.blue,
                      Colors.amber,
                      Colors.purple,
                      Colors.pink,
                      Colors.orange,
                      Colors.cyan,
                      Colors.teal,
                      Colors.green,
                      Colors.deepOrangeAccent,
                      Colors.grey,
                      Colors.lightBlue,
                    ],
                    title: const ChartTitle(
                        text: 'تاریخچه درآمد ها',
                        alignment: ChartAlignment.center,
                        textStyle: TextStyle(fontFamily: 'sansir')),
                    series: [
                      DoughnutSeries<_SalesData, String>(
                        // legendIconType: LegendIconType.circle,
                        explodeIndex: 1,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        name: 'موجودی',
                        dataLabelMapper: (_SalesData data, _) => '',
                        dataSource: data,
                        xValueMapper: (_SalesData data, _) => data.year,
                        yValueMapper: (_SalesData data, _) => data.sales,
                        radius: '100%',
                      )
                    ],
                  ),
                ),
              ],
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
                      children: [
                        Row(
                          children: [
                            Column(
                              //avali
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green[800],
                                )
                                // Image.asset(
                                //   'images/bit.png',
                                //   scale: 50,
                                // )
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
                      children: [
                        Row(
                          children: [
                            Column(
                              //avali
                              children: [
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.red[600],
                                )
                                // Image.asset(
                                //   'images/bit.png',
                                //   scale: 50,
                                // )
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
    );
  }
}
