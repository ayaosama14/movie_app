import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';

ThemeData appThemeLight() {
  return ThemeData(
      scaffoldBackgroundColor: const Color(0xffabccc3),
      colorScheme: ColorScheme.light(
          primary: AppColor.primColor, secondary: AppColor.secColor),
      textTheme: const TextTheme(
        bodyLarge: AppStyle.boldColorTextStyle22,
        bodyMedium: AppStyle.boldBlackTextStyle20,
        bodySmall: AppStyle.textStyle14,
        displayMedium  : AppStyle.thinTextStyle16,
        displaySmall: AppStyle.greyTextStyle12,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: AppStyle.boldBlackTextStyle20,
      )

      // appBarTheme:
      );}
  ThemeData appThemeDark(){
    return ThemeData();
  }

