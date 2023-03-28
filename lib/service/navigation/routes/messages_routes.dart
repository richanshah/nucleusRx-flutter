import '../../../../utils/exports.dart';

class MessagesRoutes {
  MessagesRoutes._();

  static final routes = [
    GetPage(
      name: AppPaths.messages,
      page: MessagesPage.new,
      preventDuplicates: true,
      binding: MessagesBindings(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
