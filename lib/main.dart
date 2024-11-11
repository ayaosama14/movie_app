 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA')

      ],
      path: 'asset/translation',
      // fallbackLocale: const Locale('en', 'US'),
    startLocale:const   Locale('ar', 'SA'),
    child:
    const MovieApp(),
  ),
  );
}
