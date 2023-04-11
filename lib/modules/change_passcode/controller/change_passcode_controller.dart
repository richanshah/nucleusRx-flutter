import '../../../utils/exports.dart';

class ChangePasscodeController extends BaseGetxController {
  // -------------- Text field Controller ---------------
  final passCodeController = OtpFieldController();

  /// Local Variables
  String otpValue = '';


/*
  Future<SendOtpToUser> changePasscode() async {
    final changePasscode = await changePasscodeRepository.changePasscode(
      otpValue,
    );
    return changePasscode;
  }*/
}
