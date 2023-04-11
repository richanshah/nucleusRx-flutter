import 'package:otp_text_field/otp_field.dart';

import '../../utils/exports.dart';



/// always use ViewControllerBase with BaseGetView and BaseGetResponsiveView
/// it will give proper handling over lifecycle and state management

class OtpController extends BaseGetxController {
  var switch1 = false.obs;
  var isObscure = true.obs;
  /// -------------- Text field Controller ---------------
  final phoneController = TextEditingController();
  final otpController = OtpFieldController();

  /// Local Variables
  String otpValue = '';

}
