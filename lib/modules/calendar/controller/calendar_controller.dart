import '../../../utils/exports.dart';
import 'dart:collection';

class CalendarController extends BaseGetxController {
  late final DashboardController dashboardController;
  var focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = null.obs;

  late final DateTime today;
  late final DateTime firstDay;
  late final DateTime lastDay;

  /// Example events.
  ///
  /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
  late final LinkedHashMap<DateTime, List<CalendarEvent>> events;

  late final Map<DateTime, List<CalendarEvent>> eventSource;
  
  final calendarList = const [
    CalendarEvent(0xFF5CAC4D, 'FIRST START DAYCARE', '8:20AM - 3:05PM'),
    CalendarEvent(0xFFED2755, 'HARAHAN MIDDLE', '7:20AM - 2:05PM'),
    CalendarEvent(0xFF6E7ECE, 'GRACE KING', '7:45AM - 2:40PM'),
    CalendarEvent(0xFFD18D40, 'LAST END DAYCARE', '8:20AM - 3:05PM'),
  ];

  @override
  void onControllerInit() {
    super.onControllerInit();
  /*  dashboardController =
        Get.find<DashboardController>(tag: (DashboardPage).toString());
    today = DateTime.now();
    firstDay = DateTime(today.year, DateTime.january, 1);
    lastDay = DateTime(today.year, DateTime.december, 31);
    eventSource = {
      for (var item in List.generate(50, (index) => index))
        DateTime.utc(firstDay.year, firstDay.month, item * 5): List.generate(
          item % 4 + 1,
          (index) => calendarList[index % 4],
        )
    }..addAll({
        today: [
          ...calendarList.take(2),
        ],
      });
    events = LinkedHashMap<DateTime, List<CalendarEvent>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventSource);
    selectedDay = focusedDay;*/
  }

  void onBackPressed() {
    Get.back(id: 1);
    dashboardController.updateCurrentIndex();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    final isOutside = selectedDay.month != focusedDay.month;
    if (!isOutside) {
      if (!isSameDay(this.selectedDay.value, selectedDay)) {
        this.selectedDay.value = selectedDay;
        this.focusedDay.value = focusedDay;
        // _selectedEvents.value = _getEventsForDay(selectedDay);
      }
    }
  }

  List<CalendarEvent> getEventsForDay(DateTime day) {
    // Implementation example
    return eventSource[day] ?? [];
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
