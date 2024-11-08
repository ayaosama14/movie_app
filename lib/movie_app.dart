import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import 'core/featchers/auth_fetcher/presentation/views/login_view.dart';
import 'core/featchers/auth_fetcher/presentation/views/register_view.dart';
import 'core/featchers/home_fetcher/presentation/views/details_view.dart';
import 'core/featchers/home_fetcher/presentation/views/home_view.dart';
import 'core/utils/app_localization.dart';

class MovieApp extends StatelessWidget{
  const MovieApp({super.key});



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xffabccc3)),
    initialRoute: LoginView.id,
    routes: {
    LoginView.id: (BuildContext context) => const LoginView(),
    RegisterView.id: (BuildContext context) => const RegisterView(),
    HomeView.id: (BuildContext context) => const HomeView(),
    DetailsMovieView.id: (BuildContext context) =>  DetailsMovieView(),
    },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
