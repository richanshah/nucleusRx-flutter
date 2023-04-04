import '../../../../utils/exports.dart';

class WellnessRoutes {
  WellnessRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.wellness,
      page: WellnessPage.new,
      preventDuplicates: true,
      binding: WellnessBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
