import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../modules/device_details/models/requests/device.dart';
class DevicePreferences {

  static const deviceItemOne = Device(
      label: 'SERIAL NO',value: '0011111111');
  static const deviceItemTwo = Device(
      label: 'MAC ADDRESS',value: '80:as:85:vf:a4:c2');
  static const deviceItemThree = Device(
      label: 'DEVICE HEALTH',value: '');
  static List<Device> myList = <Device>[deviceItemOne,deviceItemTwo,deviceItemThree];

}

class ImageUtils {
  static Future<File> imageToFile({required String imageName, required String ext}) async {
    var bytes = await rootBundle.load('assets/images/$imageName.$ext');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/profile.png');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }
}
