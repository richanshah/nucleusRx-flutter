import '../../../../utils/exports.dart';

class ChildBusDetailsRoutes {
  ChildBusDetailsRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.childBusDetails,
      page: ChildBusDetailsPage.new,
      preventDuplicates: true,
      binding: ChildBusDetailsBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
