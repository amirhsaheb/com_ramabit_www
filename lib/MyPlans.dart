import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:com_ramabit_www/utility/connection.dart';

List plans = [];

void main() async => runApp(const FirstScreen());

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void initState() {
    _getPlans();
    super.initState();
  }

  _getPlans() async {
    plans = await sendback().get('plan');
    setState(() {});
  }

  _ClosePlans(id) async {
    var result = await sendback().post('closeplan', {'bidid': id.toString()});
    showAlertDialog(context, result.toString());
    _getPlans();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            for (var item in plans)
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).highlightColor,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.green,
                                  child: Text(
                                    item['plan']['title'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: MediaQuery.of(context).size.width,
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
                                        Text('مبلغ شروع'),
                                        Text(item['deposit'].toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('زمان شروع'),
                                        Text(item['date_field'].toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('دوره'),
                                        Text(item['plan']['period']
                                            .toString()
                                            .replaceFirst(
                                                'half-year', ' شش ماهه')
                                            .replaceFirst('year', '  سالانه')
                                            .replaceFirst('month', ' ماهانه'))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('درصد سود'),
                                        Text(item['plan']['percent'].toString())
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 0)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red[800]),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))))),
                                    onPressed: () {
                                      _ClosePlans(item['id']);
                                    },
                                    child: Text(
                                      'بستن پلن',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, result) {
    // set up the button
    // Widget okButton = TextButton(
    //   child: Text("OK"),
    //   onPressed: () {},
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("نتیجه"),
      content: Text(result),
      // actions: [
      //   // okButton,
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
