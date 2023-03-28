import '../../../../utils/exports.dart';

class CalendarRoutes {
  CalendarRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.calendar,
      page: CalendarPage.new,
      preventDuplicates: true,
      binding: CalendarBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
