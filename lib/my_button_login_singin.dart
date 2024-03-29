import 'package:flutter/material.dart';

class MyButtonSingin extends StatelessWidget {
  final Function()? onTap;

  const MyButtonSingin({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
            color: Color(0xFFFFD700), borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            'ورود',
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
      ),
    );
  }
}
