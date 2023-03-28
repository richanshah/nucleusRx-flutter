import '../../../utils/exports.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), tag: (HomePage).toString());
    Get.put(ChildListController(), tag: (ChildListPage).toString());
    Get.put(BusListController(), tag: (BusListPage).toString());
  }
}