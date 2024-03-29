import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool secretpass;

  const MyTextFeild({
    super.key,
    this.controller,
    required this.hinttext,
    required this.secretpass,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        textAlign: TextAlign.center,
        // style:,
        // style: TextStyle(fontSize: null),
        keyboardType: TextInputType.number,
        controller: controller,
        obscureText: secretpass,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),

          // labelText: 'Username',
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
        ),
      ),
    );
  }
}
