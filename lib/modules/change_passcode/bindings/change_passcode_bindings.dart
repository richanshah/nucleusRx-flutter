import 'package:ssc_parent/modules/change_passcode/change_passcode.dart';

import '../../../utils/exports.dart';

class ChangePasscodeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ChangePasscodeController(), tag: (ChangePasscodePage).toString());
  }
}