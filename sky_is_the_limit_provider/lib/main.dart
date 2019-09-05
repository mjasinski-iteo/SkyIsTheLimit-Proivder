import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_is_the_limit_provider/domain/auto_reload_timer.dart';
import 'package:sky_is_the_limit_provider/network/articles_api.dart';
import 'package:sky_is_the_limit_provider/route/app_router.dart';
import 'package:sky_is_the_limit_provider/style/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ArticlesApi>.value(value: ArticlesApi()),
//        ChangeNotifierProvider<AutoReloadTimer>.value(
//            notifier: AutoReloadTimer()),
      ],
      child: MaterialApp(
        title: 'iteo',
        theme: Themes.mainTheme,
        initialRoute: SPLASH,
        routes: AppRouter.buildRoutes(),
      ),
    );
  }
}
