import '../../../../utils/exports.dart';

class AlertsRoutes {
  AlertsRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.alerts,
      page: WellnessPage.new,
      preventDuplicates: true,
      binding: AlertsBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
