
import '../../../utils/exports.dart';

class UserDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(UserDetailsController(), tag: (UserDetailsPage).toString());
  }
}