import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List contexList = [
  // {
  //   "get_image":
  //       'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'title': 'banners1'
  // },
];

class activityeelanview extends StatefulWidget {
  const activityeelanview({super.key});

  @override
  State<activityeelanview> createState() => _activityeelanviewState();
}

class _activityeelanviewState extends State<activityeelanview> {
  var client = http.Client();
  List imageSliders = [Container()];
  void initState() {
    _getBanner();
    setState(() {});
    super.initState();
  }

  _getBanner() async {
    contexList = [];
    var response = json.decode(utf8.decode((await client.get(
      Uri.parse('https://ryanai.ir/api/v1/elan'),
    ))
        .bodyBytes));
    setState(() {
      contexList = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'اعلان ها',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 0.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              for (var item in contexList)
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Text(
                                  item['title'],
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  // overflow: TextOverflow.values.first,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  height: 65,
                                  child: Text(
                                    (item['text']),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 100,
                            child: Image.network(item['get_image']
                                // scale: 5,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
