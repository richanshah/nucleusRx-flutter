import '../../../utils/exports.dart';

class BusListBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BusListController(), tag: (BusListPage).toString());
  }
}