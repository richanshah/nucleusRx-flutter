import 'package:ssc_parent/modules/otp/otp_binding.dart';
import 'package:ssc_parent/modules/otp/otp_page.dart';

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
