import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'exports.dart';
class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;

  MainAppBar({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBar(
        backgroundColor: AppColors.primaryColor,
          titleTextStyle: AppStyles.textMedium,
          title:  Text(title),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back,
                color: AppColors.white, textDirection: TextDirection.ltr),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight-5);
}
