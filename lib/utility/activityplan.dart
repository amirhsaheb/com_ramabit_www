import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/src/widgets/container.dart';

List mojodi = [];
double usd = 0;

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class activityplansviewState extends StatefulWidget {
  const activityplansviewState({super.key});

  @override
  State<activityplansviewState> createState() => _activityplansviewStateState();
}

List plans = [];
var nums = [1, 2, 3, 4, 5, 6, 7, 8];
var haveIt = [0];
var rng = Random();
generateUniqueRandom() {
  //Generate random number
  var rand = 0;
  for (var item in nums) {
    if (haveIt.length == 8) {
      haveIt = [];
    }
    if (!haveIt.contains(item)) {
      haveIt.add(item);
      return item;
    }
  }
}

class _activityplansviewStateState extends State<activityplansviewState> {
  List<_SalesData> data = [];
  var client = http.Client();
  List imageSliders = [Container()];
  void initState() {
    _getchart();
    setState(() {});
    super.initState();
  }

  _getchart() async {
    mojodi = await sendback().get('wallets');
    // print(mojodi);
    data = [];
    for (var item in mojodi) {
      var datas = _SalesData(item[2], item[1] * item[5]);
      usd = usd + (item[1] * item[5]);
      data.add(datas);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).hoverColor,
      height: 370,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SfCircularChart(
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
                xValueMapper: (_SalesData data, _) => data.year,
                yValueMapper: (_SalesData data, _) => data.sales,
                radius: '100%',
              )
            ],
          ),
          Text('مجموع موجودی دلاری:' + usd.toString()),
        ],
      ),
    )
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: SizedBox(
        //         height: 300,
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: ListView(
        //             shrinkWrap: true,
        //             scrollDirection: Axis.horizontal,
        //             children: [
        //               for (var item in plans)
        //                 Padding(
        //                   padding: const EdgeInsets.all(3.0),
        //                   child: Container(
        //                     padding: EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                         image: AssetImage('images/p' +
        //                             generateUniqueRandom().toString() +
        //                             '.png'),
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                     width: MediaQuery.sizeOf(context).width * .40,
        //                     // color: Colors.red,
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           item['title'],
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                               fontSize: 16, fontWeight: FontWeight.bold),
        //                         ),
        //                         Divider(
        //                           height: 20,
        //                           color: Colors.grey,
        //                         ),
        //                         Text(
        //                           item['percent'].toString(),
        //                           textAlign: TextAlign.center,
        //                           // textDirection: TextDirection.ltr,
        //                           style: TextStyle(
        //                               fontSize: 26, fontWeight: FontWeight.bold),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //             ],

        //             // itemCount: products.length,
        //           ),
        //         ),
        //       ),
        //     ),
        //     // IconButton(
        //     //   icon: Icon(Icons.remove_circle),
        //     //   onPressed: () {},
        //     // ),
        //   ],
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // );
        ;
  }
}
