import 'dart:async';

import 'package:flutter/services.dart';

class RotationFlutter {
  static const MethodChannel _channel =
      const MethodChannel('rotation_flutter');

  static Future<bool> get forceHorizontal async {
    final bool rotated = await _channel.invokeMethod('forceHorizontal');

    return true;
  }

  static Future<bool> get forceVertical async {
    final bool rotated = await _channel.invokeMethod('forceVertical');

    return true;
  }

  static Future<bool> get isKeptOn async {
    final bool resp = await _channel.invokeMethod('isKeptOn');

    return resp;
  }

  static Future<bool> keepOn(bool value) async {
    final bool rotated = await _channel.invokeMethod('keepOn', {"on" : value});

    return true;
  }
}
