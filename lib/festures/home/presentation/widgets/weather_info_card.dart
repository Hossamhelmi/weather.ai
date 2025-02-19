import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const WeatherInfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.white),
        ),
         SizedBox(height: 5.h),
        Text(
          value,
          style: GoogleFonts.poppins(
              fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}