import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:com_ramabit_www/utility/connection.dart';

bool got = false;
var result = '';
final mablaghcoin = TextEditingController();

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}

late Map plans = {"title": ''};
void main() async => runApp(singlemine());

class singlemine extends StatefulWidget {
  singlemine({super.key});

  @override
  State<singlemine> createState() => _singlemineState();
}

class _singlemineState extends State<singlemine> {
  @override
  void initState() {
    plans = {
      "title": '',
    };
    mablaghcoin.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var planid = ModalRoute.of(context)!.settings.arguments as Map;
    String _selectedValue = 'add';

    getUser() async {
      // print('oneplan/' + planid['id'].toString());
      plans = await sendback().get('onemine/' + planid['id'].toString());
      got = true;
      setState(() {});
    }

    submit() async {
      result = await sendback().post('rentminers', {
        'amount': mablaghcoin.text,
        'miner': planid['id'].toString(),
        // 'option': _selectedValue
      });
      got = true;
      showAlertDialog(context, result);
      mablaghcoin.clear();

      setState(() {});
    }

    if (!plans.containsKey('des')) {
      getUser();
      setState(() {});
    }

    return Scaffold(
      appBar: Myappsbar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // Row(
                    //   children: [icon
                    //     // Image.asset(
                    //     //   'images/bit.png',
                    //     //   scale: 40,
                    //     // ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'واریز و برداشت',
                    //       style: TextStyle(
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.bold,
                    //           fontFamily: 'sansir.ttf'),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Theme.of(context).highlightColor,
                          width: MediaQuery.of(context).size.width - 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 30),
                          child: Wrap(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        color: Colors.green,
                                        child: Text(
                                          plans['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(children: [
                                          if (plans.containsKey('get_pic'))
                                            Image.network(
                                              plans['get_pic'],
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (plans.containsKey('des'))
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: Text(
                                                plans['des'],
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          if (plans.containsKey('des'))
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: Text(
                                                ' سود دوره: ' +
                                                    plans['profit'].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      StatefulBuilder(
                                        builder: (context, _setState) {
                                          return Wrap(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: mablaghcoin,
                                                    cursorHeight: BorderSide
                                                        .strokeAlignCenter,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                        label: Text(
                                                          'تعداد',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'sansir'),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        6)),
                                                  )),
                                              if (plans.containsKey('des') &&
                                                  mablaghcoin.text != '')
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  child: Text(
                                                    ' مجموع سود دوره: ' +
                                                        (plans['profit'] *
                                                                int.parse(
                                                                    mablaghcoin
                                                                        .text))
                                                            .toString(),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),

//////////////

//////////////

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 0)),
                                          backgroundColor: MaterialStateProperty
                                              .all(Colors.green[800]),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8))))),
                                      onPressed: () {
                                        submit();
                                      },
                                      child: Text(
                                        'خرید',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ]),
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
