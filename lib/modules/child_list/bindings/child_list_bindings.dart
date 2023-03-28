import '../../../utils/exports.dart';

class ChildListBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ChildListController(), tag: (ChildListPage).toString());
  }

}