import '../../../utils/exports.dart';

class TodayScheduleListBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(TodayScheduleListController(), tag: (TodayScheduleListPage).toString());
  }
}