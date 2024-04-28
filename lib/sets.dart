import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';

void main() async => runApp(const kasby());

class kasby extends StatefulWidget {
  const kasby({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

class FirstScreen extends State<kasby> {
  String _filetext = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappsbar(),
      body: Container(
        // color: Color.fromARGB(255, 231, 225, 225),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //////

            //////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: 50,
                child: MyTextFeild(
                  hinttext: '',
                  secretpass: false,
                  numb: TextInputType.text,
                  controller: null,
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
              children: [ElevatedButton(onPressed: null, child: null)],
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
                controller: null,
              ),
            ),
          ],
        ),
      ),
    );
    void _filepicker() async {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowedExtensions: ['jpg', 'png', 'doc']);
    }

    ;
  }
}
