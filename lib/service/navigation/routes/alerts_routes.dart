import '../../../../utils/exports.dart';

class AlertsRoutes {
  AlertsRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.wellness,
      page: WellnessPage.new,
      preventDuplicates: true,
      binding: AlertsBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
