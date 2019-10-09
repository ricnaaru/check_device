import 'dart:async';

import 'package:flutter/services.dart';

enum DeviceType {
  phone,
  pad,
  unspecified,
  tv,
  carPlay,
}

class DeviceChecker {
  static const MethodChannel _channel = const MethodChannel('device_checker');

  static Future<DeviceType> get deviceType async {
    final String version = await _channel.invokeMethod('checkDevice');
    switch(version) {
      case "phone":
        return DeviceType.phone;
      case "pad":
        return DeviceType.pad;
      case "unspecified":
        return DeviceType.unspecified;
      case "tv":
        return DeviceType.tv;
      case "carPlay":
        return DeviceType.carPlay;
    }

    return null;
  }
}
