import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_ai/core/app_router.dart';
import 'package:weather_ai/core/utilites/strings.dart';
import 'package:weather_ai/festures/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:weather_ai/festures/auth/presentation/widgets/auth_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signupformKey = GlobalKey<FormState>();

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
              const SnackBar(content: Text(AppStrings.signUpSucessful)),
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
          padding: const EdgeInsets.fromLTRB(24.0, 80.0, 24.0, 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppStrings.signUp,
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
                  AppStrings.signUpToContinue,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ),
              SizedBox(height: 32.h),
              Form(
                key: signupformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(AppStrings.fullName,
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8.h),
                    authTextField(
                        controller: fullNameController,
                        hint: AppStrings.fullName),
                    SizedBox(height: 16.h),
                    const Text(AppStrings.email,
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8.h),
                    authTextField(
                        controller: emailController, hint: AppStrings.email),
                    SizedBox(height: 16.h),
                    const Text(AppStrings.password,
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8.h),
                    authTextField(
                        controller: passwordController,
                        hint: AppStrings.password,
                        isPassword: true),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 90.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    if (signupformKey.currentState!.validate()) {
                      context.read<AuthCubit>().signUp(
                            email: emailController.text.trim(),
                            fullname: fullNameController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    }
                  },
                  child: Text(
                    AppStrings.next,
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(Routes.login);
                  },
                  child: const Text(
                    AppStrings.haveAnAccount,
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
