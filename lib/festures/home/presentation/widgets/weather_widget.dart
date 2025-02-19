import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_ai/core/utilites/strings.dart';
import 'package:weather_ai/festures/home/presentation/cubits/cubit/weather_cubit.dart';
import 'package:weather_ai/festures/home/presentation/widgets/weather_info_card.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: const CircularProgressIndicator());
        }

        if (state is WeatherError) {
          return Text(
            state.message,
            style: TextStyle(fontSize: 30.sp),
          );
        }
        if (state is WeatherLoaded || state is IndexChanged) {
          return Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100.h,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: context
                              .read<WeatherCubit>()
                              .myWeather
                              .days
                              .length,
                          itemBuilder: (context, index) {
                            bool isSelected = index ==
                                context.read<WeatherCubit>().calenderIndex;
                              /*  
                            DateTime parsedDate = DateFormat("yyyy-MM-dd")
                                .parse(context
                                    .read<WeatherCubit>()
                                    .myWeather
                                    .days[index]
                                    .date!);

                            String formattedDate =
                                DateFormat("EEE, d").format(parsedDate);
                                */
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<WeatherCubit>()
                                    .changeSelectedDay(index);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      context.read<WeatherCubit>().myWeather.days[index].date!.substring(0, 3),
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          color: Colors.blue.shade900),
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      context.read<WeatherCubit>().myWeather.days[index].date!.substring(4),
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.blue.shade900
                                              : Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: Text(
                      "${context.read<WeatherCubit>().myWeather.days[context.read<WeatherCubit>().calenderIndex].day!.avgtempC}°C",
                      style: GoogleFonts.poppins(
                          fontSize: 60.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 80.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherInfoCard(
                          title: AppStrings.humidity,
                          value:
                              "${context.read<WeatherCubit>().myWeather.days[context.read<WeatherCubit>().calenderIndex].day!.avghumidity}%"),
                      WeatherInfoCard(
                          title: AppStrings.wind,
                          value:
                              "${context.read<WeatherCubit>().myWeather.days[context.read<WeatherCubit>().calenderIndex].day!.maxwindKph} km/h"),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
