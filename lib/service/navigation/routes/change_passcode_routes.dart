import '../../../../utils/exports.dart';

class ChangePasscodeRoutes {
  ChangePasscodeRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.changePasscode,
      page: ChangePasscodePage.new,
      preventDuplicates: true,
      binding: ChangePasscodeBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
