import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:com_ramabit_www/utility/connection.dart';

String format2(Date d) {
  final f = d.formatter;

  return '${f.dd}/${f.mm}/${f.yyyy}';
}

var miners = [];
void main() async => runApp(const FirstScreen());

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void initState() {
    getMineDetails();
    super.initState();
  }

  getMineDetails() async {
    miners = await sendback().get('miner');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                for (var item in miners)
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Theme.of(context).highlightColor,
                            width: MediaQuery.of(context).size.width - 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(0),
                            child: Wrap(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      color: Colors.green,
                                      child: Text(
                                        item['miner']['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(children: [
                                    Image.network(
                                      item['get_image'],
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('پرداخت شده'),
                                        Text(item['paid'].toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('زمان شروع'),
                                        Text(format2(Jalali.fromDateTime(
                                                DateTime.parse(
                                                    item['start_date'])))
                                            .toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('دوره'),
                                        Text(item['miner']['period'].toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('سود دوره'),
                                        Text(item['miner']['profit'].toString())
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
