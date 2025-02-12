import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_ai/core/app_router.dart';
import 'package:weather_ai/festures/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:weather_ai/festures/auth/presentation/widgets/auth_text_field.dart';

import '../../../../core/utilites/strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00002B),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.loginSucessful)),
            );
            Navigator.pushReplacementNamed(context, Routes.home,
                arguments: state.user);
          } else if (state is AuthError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24.0.h, 80.0.w, 24.0.h, 24.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppStrings.login,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ),
              SizedBox(height: 32.h),
              const Text(AppStrings.email,
                  style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8.h),
              authTextField(emailController, AppStrings.email),
              SizedBox(height: 16.h),
              const Text(AppStrings.password,
                  style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8.h),
              authTextField(passwordController, AppStrings.password,
                  isPassword: true),
              SizedBox(height: 24.h),
              SizedBox(height: 24.h),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 90.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().login(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: Text(AppStrings.login,
                      style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.signup);
                  },
                  child: const Text(
                    AppStrings.dontHaveAnAccount,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
