import 'package:com_ramabit_www/Mymine.dart';
import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
import 'package:shamsi_date/shamsi_date.dart';

// TextEditingController titr = TextEditingController();
TextEditingController letter = TextEditingController();
List tickets = [];

class kasby extends StatefulWidget {
  const kasby({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

class FirstScreen extends State<kasby> {
  void initState() {
    _getticket();
    super.initState();
  }

  _getticket() async {
    tickets = await sendback().get('subjects');

    setState(() {});
  }

  // _getsuptick() async {
  //   tickets = await sendback().get('support');
  // }

  // _sendkasb() async {
  //   await sendback().post('support', {'text': letter.text});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addticket');
                    },
                    icon: Icon(Icons.add),
                    label: Text('افزودن تیکت'))
              ],
            ),
            for (var item in tickets)
              Column(
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/chatsup',
                                arguments: {'id': item[4]});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item[0],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (item[3] == 'در حال بررسی')
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.amber[600],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          item[3].toString(),
                                        )),
                                  if (item[3] == 'پاسخ داده شده')
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.orange[600],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          item[3].toString(),
                                        )),
                                  if (item[3] == 'پاسخ  مشتری')
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.green[600],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          item[3].toString(),
                                        )),
                                  if (item[3] == 'بسته شده')
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.red[600],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          item[3].toString(),
                                        ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    format2(Jalali.fromDateTime(
                                            DateTime.parse(item[1])))
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            //////////////////////

            /////////////////////
          ],
        ),
      ),
    );
  }
}
