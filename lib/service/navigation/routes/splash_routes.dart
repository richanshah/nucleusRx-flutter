import '../../../../utils/exports.dart';

class SplashRoutes {
  SplashRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.initial,
      page: SplashPage.new,
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: SplashBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
