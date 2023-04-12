import '../../../../utils/exports.dart';

class WeightRoutes {
  WeightRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.weight,
      page: HeightPage.new,
      preventDuplicates: true,
      binding: WeightBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
