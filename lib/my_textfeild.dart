import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool secretpass;
  var length;
  final TextInputType numb;
  final int lines;

  MyTextFeild(
      {super.key,
      this.controller,
      required this.hinttext,
      required this.secretpass,
      this.numb = TextInputType.text,
      this.length,
      this.lines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        textAlign: TextAlign.center,
        // style:,
        style: TextStyle(color: Colors.black),
        keyboardType: numb,
        controller: controller,
        obscureText: secretpass,
        maxLines: lines,
        minLines: lines,
        maxLength: length,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),

          // labelText: 'Username',
          hintText: hinttext,
          hintStyle: TextStyle(
              color: const Color.fromARGB(255, 28, 28, 28), fontSize: 15),
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
