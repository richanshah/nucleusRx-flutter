import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../app/core/theme/app_colors.dart';
import '../../../../utils/device_preferences.dart';

class ProfileWidget extends StatelessWidget {
   final String? imagePath;
  File? imagePlaceHolder;
  final VoidCallback onClicked;

  _setPlaceHolder() async {
    this.imagePlaceHolder = await ImageUtils.imageToFile(
        imageName: "ic_placeholder_user", ext: "png");
  }
   ProfileWidget({
    Key? key,
    required this.imagePath,
     this.imagePlaceHolder,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     _setPlaceHolder();
    return SizedBox(
      width: 180.0,
      height: 180.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.outlineBgColor,
        ),
        child: Center(
          child: Stack(
            children: [
              buildImage(),
              Positioned(
                bottom: 0,
                right: 6,
                child: buildCameraIcon(AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    // final netWorkImage = NetworkImage(imagePath!);
    final netWorkImage =  FadeInImage.assetNetwork(
      placeholder: 'assets/images/ic_placeholder_user.png',
      image: imagePath!,
    );
    final image = Image.file(
      File(imagePath!),
      fit: BoxFit.cover,
    );

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image==null?netWorkImage.image:image.image,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildCameraIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 6,
          child: const Icon(
            Icons.camera_alt_rounded,
            color: AppColors.outlineGreyColor,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
