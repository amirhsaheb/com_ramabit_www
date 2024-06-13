import 'package:com_ramabit_www/main.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/utility/connection.dart';

var id = 0;
var ticketid = 5;
TextEditingController ers = TextEditingController();
var cont = ScrollController();

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}

class chatsup extends StatefulWidget {
  const chatsup({super.key});

  @override
  State<chatsup> createState() => _chatsup();
}

class _chatsup extends State<chatsup> {
  var user;
  Map mess = {};
  List messa = [];

  _sendmessage() async {
    messa = await sendback().post('ansticket', {'des': ers.text, 'id': id});

    ers.clear();

    print(mess);
    setState(() {});

    cont.animateTo(10000000000,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var ticketid = ModalRoute.of(context)!.settings.arguments as Map;
    id = ticketid['id'];

    _getmessagesup() async {
      messa = await sendback().get(
        'tickets/' + id.toString(),
      );

      setState(() {});
      print(mess);
      cont.animateTo(10000000000,
          duration: Duration(milliseconds: 1000), curve: Curves.ease);
    }

    if (messa.length == 0) {
      _getmessagesup();
      setState(() {});
    }

    return Scaffold(
      appBar: Myappsbar(context),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color:
                            ThemeMode.dark == true ? Colors.grey : Colors.white,
                        spreadRadius: 1,
                        blurRadius: 70,
                        blurStyle: BlurStyle.normal)
                  ],
                ),
                child: Text(
                  'موضوع تیکت',
                ),
              )
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: cont,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                for (var item in messa)
                  Column(
                    children: [
                      if (item['sender'] == 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(top: 2.5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.amber,
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'شما:',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['text'],
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (item['sender'] != 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(top: 2.5, left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.greenAccent,
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'پشتیبانی:',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['text'],
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
          Container(
            height: 65,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.vertical(top: Radius.circular(0))),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      height: 65,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(0),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blueGrey),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(0))))),
                          onPressed: () {
                            _sendmessage();
                            setState(() {});
                          },
                          child: Text(
                            'ارسال',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: TextField(
                      controller: ers,
                      maxLines: null,
                      scrollController: ScrollController(),
                      decoration: InputDecoration(
                          hintText: 'متن خود را وارد کنید',
                          border: InputBorder.none),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
