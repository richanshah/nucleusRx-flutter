
import '../../../utils/exports.dart';

class DoseListBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(DoseListController(), tag: (DoseListPage).toString());
  }

}