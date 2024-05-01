import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class activityplansviewState extends StatefulWidget {
  const activityplansviewState({super.key});

  @override
  State<activityplansviewState> createState() => _activityplansviewStateState();
}

List plans = [];
var nums = [1, 2, 3, 4, 5, 6, 7, 8];
var haveIt = [0];
var rng = Random();
generateUniqueRandom() {
  //Generate random number
  var rand = 0;
  for (var item in nums) {
    if (haveIt.length == 8) {
      haveIt = [];
    }
    if (!haveIt.contains(item)) {
      haveIt.add(item);
      print(item);
      return item;
    }
  }
}

class _activityplansviewStateState extends State<activityplansviewState> {
  var client = http.Client();
  List imageSliders = [Container()];
  void initState() {
    _getBanner();
    setState(() {});
    super.initState();
  }

  _getBanner() async {
    plans = [];
    var response = json.decode(utf8.decode((await client.get(
      Uri.parse('https://ryanai.ir/api/v1/plans-index'),
    ))
        .bodyBytes));
    setState(() {
      plans = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  for (var item in plans)
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/p' +
                                generateUniqueRandom().toString() +
                                '.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: MediaQuery.sizeOf(context).width * .40,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              height: 20,
                              color: Colors.grey,
                            ),
                            Text(
                              item['percent'].toString(),
                              textAlign: TextAlign.center,
                              // textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],

                // itemCount: products.length,
              ),
            ),
          ),
        ),
        // IconButton(
        //   icon: Icon(Icons.remove_circle),
        //   onPressed: () {},
        // ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
    ;
  }
}
