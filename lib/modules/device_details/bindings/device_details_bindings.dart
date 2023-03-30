
import '../../../utils/exports.dart';

class DeviceDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(DeviceDetailsController(), tag: (DeviceDetailsPage).toString());
  }
}