import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_ai/core/app_router.dart';
import 'package:weather_ai/core/handler/location_permission_handeler.dart';
import 'package:weather_ai/core/utilites/constants.dart';
import 'package:weather_ai/core/utilites/strings.dart';

import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/home/presentation/cubits/cubit/weather_cubit.dart';
import 'package:weather_ai/festures/home/presentation/widgets/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final Position? position;
  const HomeScreen({
    super.key,
    required this.user,
    this.position,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchLocationAndWeather();
    super.initState();
  }

  Future<void> fetchLocationAndWeather() async {
    final position = await LocationPermissionHandeler.determinePosition();
    if (mounted) {
      await context
          .read<WeatherCubit>()
          .getWeather(position.latitude, position.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myAppBackgroundColor,
        centerTitle: true,
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: myAppBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  AppStrings.hello,
                  style: GoogleFonts.poppins(
                      fontSize: 40.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.user.fullname,
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            WeatherWidget(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
