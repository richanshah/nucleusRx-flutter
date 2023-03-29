import '../../../../utils/exports.dart';

class CalendarRoutes {
  CalendarRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.medSummary,
      page: MedSummaryPage.new,
      preventDuplicates: true,
      binding: CalendarBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
