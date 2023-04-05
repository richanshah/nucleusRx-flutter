import '../../../../utils/exports.dart';

class MedSummaryDetailsRoutes {
  MedSummaryDetailsRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.medSummaryDetail,
      page: MedSummaryDetailPage.new,
      preventDuplicates: true,
      binding: MedSummaryBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
