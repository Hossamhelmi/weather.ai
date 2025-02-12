  import 'package:flutter/material.dart';

Widget authTextField(TextEditingController controller, String hint,
      {bool isPassword = false}) {
    return TextField(
      cursorColor: Colors.white,
      maxLines: 1,
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey[800],
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }