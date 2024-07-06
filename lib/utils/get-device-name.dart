import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_app/utils/themeData.dart';

Future<String> getDeviceName() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName;

  if (themeData.platform == TargetPlatform.android) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceName = androidInfo.model;
  } else if (themeData.platform == TargetPlatform.iOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceName = iosInfo.name;
  } else {
    deviceName = 'Unknown';
  }

  return deviceName;
}