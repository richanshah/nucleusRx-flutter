import '../utils/exports.dart';

class AuthMiddleWare extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    // var isLoggedIn = SharedPref.getBool(PrefsKey.isLoggedIn, false);
    // if (route == AppPaths.login) {
    //   if (isLoggedIn) {
    //     return const RouteSettings(name: AppPaths.initial);
    //   }
    // } else {
    //   if (!isLoggedIn) {
    //     return const RouteSettings(name: AppPaths.login);
    //   }
    // }

    return null;
  }
}
