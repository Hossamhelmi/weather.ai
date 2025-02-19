import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_ai/core/utilites/strings.dart';

Widget authTextField(
    {required TextEditingController controller,
    required String hint,
    bool isPassword = false}) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return AppStrings.pleaseEnterSomeText;
      } else if (isPassword && value.length < 6) {
        return AppStrings.passwordMustBeAtLeast6Characters;
      } else if (hint == AppStrings.email && !value.contains('@')) {
        return AppStrings.pleaseEnterAValidEmail;
      } else if (hint == AppStrings.fullName && value.contains('.')) {
        return AppStrings.pleaseEnterAValidName;
      }
      return null;
    },
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
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
