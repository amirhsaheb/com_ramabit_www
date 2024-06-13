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
    history = await sendback().get('profits');
    print(history);
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
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  item[3],
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text(item[0]), Text(item[2])],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              //sevomi
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(item[1].toString() + item[1].toString()),
                                Text(r"$" + item[1].toString())
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    color: Theme.of(context).primaryColorLight,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ],
              ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
