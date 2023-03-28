import '../../../../utils/exports.dart';

class DashboardRoutes {
  DashboardRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.dashboard,
      page: DashboardPage.new,
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: DashboardBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
      children: [
        ...HomeRoutes.routes,
        ...CalendarRoutes.routes,
        ...AlertsRoutes.routes,
        ...MessagesRoutes.routes,
        ...SettingsRoutes.routes,
        ...ChildBusDetailsRoutes.routes,
      ],
    ),
  ];
}
