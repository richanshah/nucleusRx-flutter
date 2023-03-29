import '../../../utils/exports.dart';

class CalendarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MedSummaryController(), tag: (MedSummaryPage).toString());
  }
}
