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
void main() async => runApp(singleplans());

class singleplans extends StatefulWidget {
  singleplans({super.key});

  @override
  State<singleplans> createState() => _singleplansState();
}

class _singleplansState extends State<singleplans> {
  @override
  void initState() {
    plans = {
      "title": '',
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var planid = ModalRoute.of(context)!.settings.arguments as Map;
    String _selectedValue = 'add';

    getUser() async {
      print('oneplan/' + planid['id'].toString());
      plans = await sendback().get('oneplan/' + planid['id'].toString());
      got = true;
      setState(() {});
    }

    submit() async {
      result = await sendback().post('buyplan', {
        'amount': mablaghcoin.text,
        'plan': planid['id'].toString(),
        'option': _selectedValue
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
                                          if (plans.containsKey('get_image'))
                                            Image.network(
                                              plans['get_image'],
                                              scale: 20,
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ]),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            controller: mablaghcoin,
                                            cursorHeight:
                                                BorderSide.strokeAlignCenter,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                label: Text(
                                                  'مبلغ',
                                                  style: TextStyle(
                                                      fontFamily: 'sansir'),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 6)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      StatefulBuilder(
                                        builder: (context, _setState) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Radio(
                                                        value: 'add',
                                                        groupValue:
                                                            _selectedValue,
                                                        onChanged: (value) =>
                                                            _setState(() {
                                                              _selectedValue =
                                                                  value!;
                                                            })),
                                                    Text(
                                                        "اضافه شدن سود به پلن"),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio(
                                                        value: 'wal',
                                                        groupValue:
                                                            _selectedValue,
                                                        onChanged: (value) =>
                                                            _setState(() {
                                                              _selectedValue =
                                                                  value!;
                                                            })),
                                                    Text(
                                                        "اضافه شدن سود به کیف پول"),
                                                  ],
                                                ),
                                              ],
                                            ),
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
                                        'ثبت پلن',
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
