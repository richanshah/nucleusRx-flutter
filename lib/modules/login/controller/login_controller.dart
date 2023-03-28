import 'package:otp_text_field/otp_field.dart';

import '../../../../utils/exports.dart';

class LoginController extends BaseGetxController {
  var isObscure = true.obs;

  // -------------- Text field Controller ---------------
  final phoneController = TextEditingController();
  final otpController = OtpFieldController();

// -------------- Local Variables ---------------
  String otpValue = '';
  RegExp digitValidator = RegExp("[0-9]+");
  bool isANumber = true;


  final emailValidator = MultiValidator([
    RequiredValidator(errorText: AppString.emailEmptyValidation.tr),
    PatternValidator(RegExpressions.email.pattern, errorText: AppString.emailPatternValidation.tr),
  ]);

  void onOtpClick() {
    Get.offAndToNamed(AppPaths.otp);
  }
}
