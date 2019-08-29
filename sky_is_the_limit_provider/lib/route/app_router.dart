import 'package:flutter/material.dart';
import 'package:sky_is_the_limit_provider/presentation/list/list_page.dart';
import 'package:sky_is_the_limit_provider/presentation/splash/splash_page.dart';

const String SPLASH = 'splash';
const String LIST = 'list';

class AppRouter {
  static Map<String, WidgetBuilder> buildRoutes() => {
        SPLASH: (context) => SplashPage(),
        LIST: (context) => ListPage(),
      };
}
