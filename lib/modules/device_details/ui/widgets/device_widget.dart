import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo_richa/gen/assets.gen.dart';

import '../../../../app/core/theme/app_colors.dart';

class DeviceDetailsWidget extends StatelessWidget {
  final String? imagePath;
  final File? imagePlaceHolder;

  const DeviceDetailsWidget({
    Key? key,
    required this.imagePath,
    this.imagePlaceHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180.0,
      child: buildImage(),
    );
  }

  Widget buildImage() {
    final image = Image.file(
      File(Assets.images.deviceDetailsBg.path),
      fit: BoxFit.cover,
    );

    return ClipRect(
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child:
            Expanded(child: Image.asset((Assets.images.deviceDetailsBg.path))),
      ),
    );
  }
}
