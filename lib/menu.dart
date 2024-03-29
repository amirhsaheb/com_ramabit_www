import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:com_ramabit_www/node.dart';

void main() async => runApp(const Menu());

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  MyMenu createState() => MyMenu();
}

class MyMenu extends State<Menu> {
  var client = http.Client();
  var user = '';

  @override
  void initState() {
    _getUser();

    super.initState();
  }

  _getUser() async {
    user = '';
    var response = json.decode(
        (await client.get(Uri.parse('https://reqres.in/api/users/2'))).body);
    user = response['data']['first_name'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          width: 250,
          backgroundColor: const Color.fromARGB(255, 52, 51, 41),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 16, right: 20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                              backgroundImage: AssetImage('images/man.png')),
                          const Padding(
                              padding: EdgeInsets.only(top: 0, right: 10)),
                          Text(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'sansir'),
                              user),
                        ],
                      ))
                ],
              ),
              const Divider(),
              const Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 16, right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(children: [
                                        Icon(color: Colors.white, Icons.home),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 0, right: 10)),
                                        Text(
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'sansir'),
                                            'خانه'),
                                      ]),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.dashboard),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'داشبورد'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.person),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'اطلاعات کاربری'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.rectangle_outlined),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'پلن ها'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.balance),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'موجودی حساب'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(color: Colors.white, Icons.paid),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'کسب درآمد'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.battery_charging_full),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'شاژ حساب'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.outbox),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'برداشت'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.history_toggle_off),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'تاریخچه درآمد ها'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.history),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'تراکنش ها'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.support),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'پشتیبانی'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.verified_user_outlined),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'احراز هویت'),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(0, 0, 0, 0),
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              color: Colors.white,
                                              Icons.exit_to_app),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 10)),
                                          Text(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'sansir'),
                                              'خروج'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              )
            ],
          )),
    );
  }
}
