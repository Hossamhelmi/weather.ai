import 'package:flutter/material.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';

class HomeScreen extends StatelessWidget {
  final User user;
 // home screen
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${user.fullname}")),
      body: Center(child: Text("Email: ${user.email}")),
    );
  }
}
