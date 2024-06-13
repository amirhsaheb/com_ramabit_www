import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';

import 'package:flutter/widgets.dart';
//
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:com_ramabit_www/utility/connection.dart';

List mojodi = [];

class _SalesData {
  _SalesData(this.name, this.mojoodi);

  final String name;
  final double mojoodi;
}

List<_SalesData> data = [];
int id = 1;

class Balances extends StatefulWidget {
  const Balances({super.key});

  @override
  State<Balances> createState() => _BalancesState();
}

class _BalancesState extends State<Balances> {
  void initState() {
    _getmojod();

    super.initState();
  }

  _getmojod() async {
    mojodi = await sendback().get('wallets');
    print(mojodi);
    data = [];
    for (var item in mojodi) {
      var datas = _SalesData(item[2], item[1] * item[5]);
      data.add(datas);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
      appBar: Myappsbar(context),
      // drawer: Menu(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                        // text: 'موجودی',
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
                        xValueMapper: (_SalesData data, _) => data.name,
                        yValueMapper: (_SalesData data, _) => data.mojoodi,
                        radius: '100%',
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            for (var item in mojodi)
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.only(right: 0))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/balance',
                            arguments: {'id': item[3]});
                      },
                      // padding: EdgeInsets.all(16),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 45,
                                      child: Image.network(
                                        item[0],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item[4],
                                          textAlign: TextAlign.right,
                                          // 'data',
                                        ),
                                        Text(
                                          item[2],
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    //sevomi
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            item[1].toString() + item[2],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(item[5].toStringAsFixed(6))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        color: Theme.of(context).primaryColorLight,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
