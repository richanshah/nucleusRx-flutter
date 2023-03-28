import '../../../../utils/exports.dart';

class LoginRoutes {
  LoginRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.login,
      page: LoginPage.new,
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: LoginBinding(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
