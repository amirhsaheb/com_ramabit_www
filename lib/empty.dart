import 'package:flutter/material.dart';
import 'package:com_ramabit_www/myappbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  FirstScreen createState() => FirstScreen();
}

class FirstScreen extends State<Menu> {
  List<dynamic> banners = [];
  var client = http.Client();
  void initState() {
    _getBanner();
    super.initState();
  }

  _getBanner() async {
    var response = json.decode(utf8.decode((await client.get(
      Uri.parse('https://ryanai.ir/api/v1/banner'),
    ))
        .bodyBytes));
    print(response);
    banners = response;
    print(banners);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in banners)
          Row(
            children: [
              Text(
                item['title'],
              ),
            ],
          )
      ],
    );
  }
}
