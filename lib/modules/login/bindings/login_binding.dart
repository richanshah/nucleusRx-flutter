import '../../../utils/exports.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), tag: (LoginPage).toString());
  }
}
