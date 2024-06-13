import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/my_textfeild.dart';

TextEditingController titr = TextEditingController();
TextEditingController pos = TextEditingController();
TextEditingController letter = TextEditingController();
var poss = TextEditingValue();

class kasby extends StatefulWidget {
  const kasby({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

class FirstScreen extends State<kasby> {
  _sendkasb() async {
    await sendback().post('kasb', {'title': titr.text, 'text': letter.text});
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
                  hinttext: 'تیتر',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu(
                  controller: null,
                  hintText: 'موقعیت شغلی',
                  width: MediaQuery.of(context).size.width * 0.85,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: 1,
                      label: 'تریدر',
                    ),
                    DropdownMenuEntry(
                      value: 2,
                      label: 'توسعه دهنده',
                    ),
                  ],
                )
              ],
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
                  _sendkasb();
                },
                child: Text('ارسال'))
          ],
        ),
      ),
    );
  }
}
