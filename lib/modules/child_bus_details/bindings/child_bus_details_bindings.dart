import '../../../utils/exports.dart';

class ChildBusDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ChildBusDetailsController(), tag: (ChildBusDetailsPage).toString());
  }

}