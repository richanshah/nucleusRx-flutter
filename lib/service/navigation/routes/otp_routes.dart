import 'package:flutter_demo_richa/modules/otp/otp_page.dart';
import 'package:flutter_demo_richa/modules/otp/otp_binding.dart';

import '../../../../utils/exports.dart';

class OtpRoutes {
  OtpRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.otp,
      page: OtpPage.new,
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: OtpBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
