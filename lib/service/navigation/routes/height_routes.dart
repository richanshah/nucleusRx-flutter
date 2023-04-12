import '../../../../utils/exports.dart';

class HeightRoutes {
  HeightRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.height,
      page: HeightPage.new,
      preventDuplicates: true,
      binding: HeightBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
