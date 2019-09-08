import 'dart:async';

import 'package:flutter/cupertino.dart';

class AutoReloadTimer extends ChangeNotifier {
  Timer _timer;

  void startTimer() {
//    _timer = Timer.periodic(Duration(seconds: 10), (_) {
//      notifyListeners();
//    });
  }

  void stopTimer() {
//    _timer.cancel();
  }
}
