import 'package:com_ramabit_www/activity1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';
import 'package:com_ramabit_www/utility/connection.dart';

List wallet = [];
var addressqr = TextEditingController();
var mablagh = TextEditingController();
var rahgiri = TextEditingController();

var mablagh1 = TextEditingController();
var walletaddress = TextEditingController();

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var walletid = ModalRoute.of(context)!.settings.arguments as Map;
    _getwallet() async {
      wallet =
          await sendback().post('wallets/' + walletid['id'].toString(), null);
      addressqr.text = wallet[0][5];
      print(wallet);
      setState(() {});
    }

    _ersal() async {
      try {
        await sendback().post('addamountreq', {
          'amount': mablagh.text,
          'link': rahgiri.text,
          'cur': walletid['id'].toString()
        });
        showAlertDialog(context, 'با موفقیت انجام شد');
      } on Exception catch (_) {
        showAlertDialog(context, 'انجام نشد');
      }
    }

    _bardasht() async {
      try {
        await sendback().post('askamountreq', {
          'amount': mablagh1.text,
          'link': walletaddress.text,
          'cur': walletid['id'].toString()
        });
        showAlertDialog(context, 'با موفقیت انجام شد');
      } on Exception catch (_) {
        showAlertDialog(context, 'انجام نشد');
      }
    }

    if (wallet.length == 0) {
      _getwallet();
      setState(() {});
    } else if (wallet[0][3] != walletid['id']) {
      wallet = [];
      _getwallet();
      setState(() {});
    }

    return Scaffold(
      appBar: Myappsbar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            if (wallet.length != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            wallet[0][0],
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'واریز / برداشت',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sansir.ttf'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            color: Theme.of(context).highlightColor,
                            width: MediaQuery.of(context).size.width - 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(0),
                            child: Wrap(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          color: Colors.green,
                                          child: Text(
                                            'واریز',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          child: Column(children: [
                                            Image.network(
                                              wallet[0][4],
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 250,
                                              child: TextField(
                                                controller: addressqr,
                                                cursorHeight: BorderSide
                                                    .strokeAlignCenter,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    hintText: '',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal: 6)),
                                              ),
                                            ),
                                            TextButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        MaterialStateProperty.all(
                                                            EdgeInsets.symmetric(
                                                                horizontal: 20,
                                                                vertical: 0)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.amber),
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        8))))),
                                                onPressed: () {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text:
                                                              addressqr.text));
                                                },
                                                child: Text(
                                                  'کپی',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )),
                                            Container(
                                              width: 250,
                                              child: TextField(
                                                controller: mablagh,
                                                cursorHeight: BorderSide
                                                    .strokeAlignCenter,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    hintText: 'مبلغ',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal: 6)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 250,
                                              child: TextField(
                                                controller: rahgiri,
                                                cursorHeight: BorderSide
                                                    .strokeAlignCenter,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    hintText: 'کد رهگیری',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal: 6)),
                                              ),
                                            ),
                                            TextButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        MaterialStateProperty.all(
                                                            EdgeInsets.symmetric(
                                                                horizontal: 20,
                                                                vertical: 0)),
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                            Colors.green[500]),
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        8))))),
                                                onPressed: () {
                                                  _ersal();
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  'ثبت',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )),
                                          ]),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Theme.of(context).highlightColor,
                          width: MediaQuery.of(context).size.width - 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
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
                                        color: Colors.red[800]
                                        // ThemeData.dark()
                                        //     .colorScheme
                                        //     .errorContainer
                                        ,
                                        child: Text(
                                          'برداشت',
                                          style: TextStyle(
                                              // color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(children: [
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: mablagh1,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText: 'مبلغ',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 250,
                                            child: TextField(
                                              controller: walletaddress,
                                              cursorHeight:
                                                  BorderSide.strokeAlignCenter,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  hintText: 'آدرس کیف پول',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 6)),
                                            ),
                                          ),
                                          TextButton(
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 0)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green[500]),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      8))))),
                                              onPressed: () {
                                                _bardasht();
                                                setState(() {});
                                              },
                                              child: Text(
                                                'ثبت',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )),
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Theme.of(context).highlightColor,
                          width: MediaQuery.of(context).size.width - 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          child: Wrap(
                            children: [
                              Column(
                                children: [],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
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
