import 'package:com_ramabit_www/main.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/utility/connection.dart';

TextEditingController ers = TextEditingController();
var cont = ScrollController();

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chat();
}

class _chat extends State<chat> {
  var user;
  Map mess = {};
  List messa = [];
  void initState() {
    _getmessage();
    super.initState();
  }

  _getmessage() async {
    mess = await sendback().get(
      'chats/$chaturi/messages/',
    );
    messa = mess['messages'];
    setState(() {});
    print(mess);
    cont.animateTo(10000000000,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  _sendmessage() async {
    mess = await sendback()
        .post('chats/$chaturi/messages/', {'message': ers.text});
    messa = mess['messages'];
    ers.clear();

    print(mess);
    setState(() {});

    cont.animateTo(10000000000,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            controller: cont,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (var item in messa)
                  Column(
                    children: [
                      if (chatuser == item['user'])
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
                                        item['message'],
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
                      if (chatuser != item['user'])
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
                                        item['message'],
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
