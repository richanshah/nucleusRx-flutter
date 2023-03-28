import '../../../utils/exports.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController(), tag: (SplashPage).toString());
  }
}