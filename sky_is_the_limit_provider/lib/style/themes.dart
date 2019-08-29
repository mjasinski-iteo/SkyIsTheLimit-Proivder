import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData get mainTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          color: AppColors.mainOrange,
          textTheme: TextTheme(
              title: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          )),
        ),
      );
}
