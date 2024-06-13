import 'package:com_ramabit_www/utility/connection.dart';
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

List eelan = [];

class activityeelanview extends StatefulWidget {
  const activityeelanview({super.key});

  @override
  State<activityeelanview> createState() => _activityeelanviewState();
}

class _activityeelanviewState extends State<activityeelanview> {
  var client = http.Client();
  List imageSliders = [Container()];
  void initState() {
    _geteelan();
    setState(() {});
    super.initState();
  }

  _geteelan() async {
    eelan = await sendback().get('posts');
    print(eelan);
    setState(() {});
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'آخرین اخبار',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var item in eelan)
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.39,
                        height: 90,
                        child: Image.network(
                          item['get_image'],
                          // scale: 5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: Text(
                                item['title'],
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                // overflow: TextOverflow.values.first,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
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
