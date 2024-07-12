import 'package:flutter/material.dart';

class MyTextfeild extends StatelessWidget {
  final String hinttext;
  final bool obscuretext;
  final TextEditingController controller;

  const MyTextfeild({
    Key? key,
    required this.hinttext,
    required this.obscuretext,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        style: TextStyle(color: Colors.white), // Text color
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white54), // Hint text color
          filled: true,
          fillColor: Colors.grey[800], // Background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          // Floating label behavior
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
