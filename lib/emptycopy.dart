import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:flutter/services.dart';

List members = [];
var user = '';
TextEditingController linkaddusers1 = TextEditingController();

class adusers1 extends StatefulWidget {
  const adusers1({super.key});

  @override
  State<adusers1> createState() => _adusers1State();
}

class _adusers1State extends State<adusers1> {
  void initState() {
    _getmembers();
    _getUser();
    super.initState();
  }

  _getmembers() async {
    // members = await sendback().get('users/');
    setState(() {});
  }

  _getUser() async {
    user = '';
    var response = await sendback().get('user');

    user = 'ramabit.com/register/' + response['ref'].toString();
    linkaddusers1.text = user;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Text('لینک دعوت شما'),
                Container(
                  width: 250,
                  child: TextField(
                    controller: linkaddusers1,
                    cursorHeight: BorderSide.strokeAlignCenter,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: '',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 6)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8))))),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: linkaddusers1.text));
                    },
                    child: Text(
                      'کپی',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  // for (var item in members)
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //         alignment: Alignment.center,
                  //         width: MediaQuery.of(context).size.width * 0.95,
                  //         height: MediaQuery.of(context).size.height * 0.07,
                  //         decoration: BoxDecoration(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(20)),
                  //             color: Colors.amber[700],
                  //             border: Border.all(color: Colors.orange)),
                  //         child: Text(
                  //           'name',
                  //           style: TextStyle(fontSize: 30),
                  //           textAlign: TextAlign.left,
                  //         ))
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
