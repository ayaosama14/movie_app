import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie_app.dart';

import 'core/featchers/home_fetcher/data/apis/firebase_api.dart';
import 'core/utils/di.dart'as di;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 await di.setupLocator();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseApi().sendNotification();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'asset/translation',
      // fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      // startLocale:const   Locale('ar', 'SA'),

      child: const MovieApp(),
    ),
  );
}
