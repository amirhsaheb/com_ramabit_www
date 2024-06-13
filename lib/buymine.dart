import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
//

import 'package:flutter/src/widgets/container.dart';

import 'package:com_ramabit_www/utility/connection.dart';

String period = 'all';

List mineimage = [];
String cur2 = '';

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
  // var client = http.Client();
  void initState() {
    _getUser('');
    _getimagecoin();
    super.initState();
  }

  _getimagecoin() async {
    mineimage = await sendback().get('currencies');
    setState(() {});
  }

  _getUser(periodd) async {
    plans = await sendback().get('miners-date' + periodd);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
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
                          // color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.sizeOf(context).width * .24,
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          period = 'all';
                                          _getUser('');
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
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.sizeOf(context).width * .24,
                                  child: TextButton(
                                      onPressed: () {
                                        _getUser('/30');
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
                          // color: Colors.yellow,
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.sizeOf(context).width * .24,
                                  child: TextButton(
                                      onPressed: () {
                                        _getUser('/180');
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
                          // color: Colors.orange,
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.sizeOf(context).width * .24,
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _getUser('/360');
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                height: MediaQuery.of(context).size.width * 0.12,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 255, 193, 7),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var item in mineimage)
                      Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.width * 0.12,
                          padding: EdgeInsets.all(1),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 42, 42, 42),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      cur2 != item['name']
                                          ? Color.fromARGB(255, 42, 42, 42)
                                          : Colors.green),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(2))),
                              onPressed: () {
                                cur2 = item['name'];
                                setState(() {});
                              },
                              child: Image.network(item['get_image']))),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
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
                          Navigator.pushNamed(context, '/singlemine',
                              arguments: {'id': item['id']});
                        },
                        // padding: EdgeInsets.all(16),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 40,

                                      //avali
                                      child: Image.network(
                                        item['get_pic'],
                                      )),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .75,
                                        child: Text(
                                          item['title'],
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontFamily: 'sansir',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'سود:',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontFamily: 'sansir',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              item['profit'].toString() +
                                                  item['currency']['brand'],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'sansir',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
