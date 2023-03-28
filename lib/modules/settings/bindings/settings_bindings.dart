import '../../../utils/exports.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(), tag: (SettingsPage).toString());
  }
}
