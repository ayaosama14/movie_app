import 'package:flutter/material.dart';
import 'package:movie/core/featchers/auth_fearcher/presentation/views/login_view.dart';
import 'package:movie/core/featchers/auth_fearcher/presentation/views/register_view.dart';
import 'package:movie/core/featchers/home_featcher/presentation/views/home_view.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xffabccc3)),
        initialRoute: LoginView.id,
        routes: {
          LoginView.id: (BuildContext context) => const LoginView(),
          RegisterView.id: (BuildContext context) => const RegisterView(),
          HomeView.id: (BuildContext context) => const HomeView(),
        });
  }
}
