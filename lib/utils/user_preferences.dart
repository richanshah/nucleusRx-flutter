import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../modules/user_details/models/requests/user.dart';
class UserPreferences {
  static const myUser = User(
      imagePath:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      name: 'Richa shah',
      email: 'richa.shah@gmail.com',
      about:
          'Certified Personal Developer and Reader with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
      isDarkMode: false,
      gender: 'Female',
      mrn: '12345678',
      phone: '9016804343',
      dob: 'Jan 15, 1952');
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
