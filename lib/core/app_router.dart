import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ai/core/di/service_locator.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/auth/presentation/cubits/auth_cubit/auth_cubit.dart';

import 'package:weather_ai/festures/auth/presentation/screens/login_screen.dart';
import 'package:weather_ai/festures/auth/presentation/screens/sign_up_screen.dart';
import 'package:weather_ai/home_screen.dart';

class Routes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String home = '/home';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(sl(), sl()),
                  child: LoginScreen(),
                ));
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(sl(), sl()),
            child: SignUpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(user: settings.arguments as User));
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
