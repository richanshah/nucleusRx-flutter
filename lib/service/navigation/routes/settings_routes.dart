
import '../../../../utils/exports.dart';

class SettingsRoutes {
  SettingsRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.settings,
      page: SettingsPage.new,
      preventDuplicates: true,
      binding: SettingsBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
