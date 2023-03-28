import '../../../../utils/exports.dart';

class HomeRoutes {
  HomeRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.home,
      page: HomePage.new,
      preventDuplicates: true,
      binding: HomeBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
