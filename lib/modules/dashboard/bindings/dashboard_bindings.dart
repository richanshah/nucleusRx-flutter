import '../../../utils/exports.dart';

class DashboardBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(DashboardController(), tag: (DashboardPage).toString());
  }
}