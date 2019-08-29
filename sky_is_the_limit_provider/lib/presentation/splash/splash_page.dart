import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_is_the_limit_provider/route/app_router.dart';
import 'package:sky_is_the_limit_provider/style/dimens.dart';
import 'package:sky_is_the_limit_provider/style/images.dart';

final SPLASH_DURATION = 3;

class SplashPage extends StatefulWidget {
  @override
  State createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Center(
            child: Image.asset(
              Images.LOGO,
              width: Dimens.SPLASH_LOGO_SIZE,
              height: Dimens.SPLASH_LOGO_SIZE,
            ),
          ),
        ),
      );

  @override
  void didUpdateWidget(SplashPage oldWidget) {
    Timer(Duration(seconds: SPLASH_DURATION), () {
      Navigator.pushNamed(context, LIST);
    });
  }
}
