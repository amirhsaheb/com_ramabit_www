import 'package:com_ramabit_www/utility/connection.dart';
import 'package:flutter/material.dart';
import 'package:com_ramabit_www/my_textfeild.dart';
// import 'package:com_ramabit_www/my_button_login_singin.dart';
import 'package:com_ramabit_www/my_button_register_singup.dart';
import 'package:flutter/widgets.dart';

class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  final name = TextEditingController();
  final lastname = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();
  final Emailcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();

  // void UserSingup() {}

  _sendregister(context) async {
    var res = await sendback().post('users/', {
      'name': name.text,
      'lastname': lastname.text,
      'username': usernamecontroller.text,
      'password': passwordcontroller.text,
      'email': Emailcontroller.text,
      'mobile': phonenumbercontroller.text
    }) as Map;
    if (res['name'] != name.text) {
      if (res.containsKey('username')) {
        showAlertDialog(context, 'یوزر نیم موجود است');
      }
      if (res.containsKey('password')) {
        showAlertDialog(context, 'امنیت پسورد ضعیف است');
      }

      return;
    }

    showAlertDialog(context, 'ثبت نام با موفقیت انجام شد');
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, '/log');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                //LOGO
                Icon(
                  color: Color(0xFFFFD700),
                  Icons.app_registration_rounded,
                  size: 50,
                ),

                SizedBox(
                  height: 0,
                ),

                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'فرم ثبت نام',
                          style: TextStyle(color: Colors.grey[100]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                //Wellcome back
                Text(
                  'مرحله اول ثبت نام',
                  style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextFeild(
                  controller: name,
                  hinttext: 'نام',
                  secretpass: false,
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextFeild(
                  controller: lastname,
                  hinttext: 'نام خانوادگی',
                  secretpass: false,
                ),

                SizedBox(
                  height: 10,
                ),
                MyTextFeild(
                  controller: usernamecontroller,
                  hinttext: 'نام کاربری',
                  secretpass: false,
                ), //username
                SizedBox(
                  height: 10,
                ),
                MyTextFeild(
                  controller: passwordcontroller,
                  hinttext: 'رمز عبور',
                  secretpass: true,
                ), //password
                SizedBox(
                  height: 10,
                ),

                MyTextFeild(
                  controller: repasswordcontroller,
                  hinttext: 'تکرار رمز عبور',
                  secretpass: true,
                ), //password

                SizedBox(
                  height: 10,
                ),
                //singin buttons
                MyTextFeild(
                  controller: Emailcontroller,
                  hinttext: 'ایمیل',
                  secretpass: false,
                ), //password

                SizedBox(
                  height: 10,
                ),

                MyTextFeild(
                  controller: phonenumbercontroller,
                  hinttext: 'موبایل',
                  secretpass: false,
                ), //password

                SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 15,
                ),

                TextButton(
                  onPressed: () {
                    if (repasswordcontroller.text == passwordcontroller.text) {
                      _sendregister(context);
                    } else {
                      print('پسورد را چک کتید');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'ثبت نام',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )

                // MyButtonSingup(
                //   onTap: UserSingup,
                // ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       "images/gmail.webp",
                //       height: 72,
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Image.asset(
                //       "images/apple.png",
                //       height: 72,
                //     )
                //   ],
                // )

                // or continu whith

                // google + apple

                // not a member ? register
              ]),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, result) {
    // set up the button
    // Widget okButton = TextButton(
    //   child: Text("OK"),
    //   onPressed: () {},
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("نتیجه"),
      content: Text(result),
      // actions: [
      //   // okButton,
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
