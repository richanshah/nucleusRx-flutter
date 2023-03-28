import '../../../utils/exports.dart';

class AlertsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AlertsController(), tag: (AlertsPage).toString());
  }
}