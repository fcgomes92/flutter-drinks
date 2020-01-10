import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SlapshView extends StatelessWidget {
  final int splashDuration = 2;

  countDownTime() async {
    return Timer(Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Navigator.of(context).pushReplacementNamed('/LoginScreen');
    });
  }

  @override
  void initState() {
    super.initState();
    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
