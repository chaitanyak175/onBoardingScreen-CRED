import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

mixin Sethighrefreshrate {
  Future<void> setHighRefreshRate() async {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } on PlatformException catch (e) {
      print("Error setting refresh rate: $e");
    }
  }
}
