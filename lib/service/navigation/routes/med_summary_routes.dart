import '../../../../utils/exports.dart';

class MedSummaryRoutes {
  MedSummaryRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.medSummary,
      page: MedSummaryPage.new,
      preventDuplicates: true,
      binding: MedSummaryBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
