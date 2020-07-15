import 'dart:async';

import 'package:flutter/material.dart';

startSplashScreenTimer(BuildContext context) async {
  void navigationToNextPage() {
    Navigator.popAndPushNamed(context, '/Login');
  }

  var _duration = new Duration(seconds: 5);
  return new Timer(_duration, navigationToNextPage);
}

