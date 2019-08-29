import 'package:flutter/material.dart';
import 'package:sky_is_the_limit_provider/route/app_router.dart';
import 'package:sky_is_the_limit_provider/style/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iteo',
      theme: Themes.mainTheme,
      initialRoute: SPLASH,
      routes: AppRouter.buildRoutes(),
    );
  }
}
