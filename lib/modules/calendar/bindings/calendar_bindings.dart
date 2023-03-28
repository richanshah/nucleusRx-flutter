import '../../../utils/exports.dart';

class CalendarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController(), tag: (CalendarPage).toString());
  }
}
