import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/my_textfeild.dart';

TextEditingController titr = TextEditingController();
TextEditingController pos = TextEditingController();
TextEditingController letter = TextEditingController();
var poss = TextEditingValue();

class ticketadd extends StatefulWidget {
  const ticketadd({super.key});

  @override
  FirstScreen220 createState() => FirstScreen220();
}

class FirstScreen220 extends State<ticketadd> {
  _sendticket() async {
    await sendback()
        .post('addticket', {'title': titr.text, 'des': letter.text});
    titr.clear();
    letter.clear();
    Navigator.pushNamedAndRemoveUntil(context, '/sup', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(context),
      body: Container(
        // color: Color.fromARGB(255, 231, 225, 225),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: 50,
                child: MyTextFeild(
                  hinttext: 'موضوع',
                  secretpass: false,
                  numb: TextInputType.text,
                  controller: titr,
                ),
              ),
            ),
            // Container(
            //   height: 50,
            //   child: MyTextFeild(
            //     hinttext: 'کسب دامد',
            //     secretpass: false,
            //     numb: TextInputType.text,
            //     controller: null,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: MyTextFeild(
                lines: 4,
                hinttext: 'متن پیام',
                secretpass: false,
                length: 10000,
                numb: TextInputType.text,
                controller: letter,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _sendticket();
                },
                child: Text('ارسال'))
          ],
        ),
      ),
    );
  }
}
