import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_checker/device_checker.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_checker');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DeviceChecker.deviceType, '42');
  });
}
