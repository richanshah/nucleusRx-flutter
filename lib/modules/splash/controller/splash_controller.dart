import '../../../utils/exports.dart';

class SplashController extends BaseGetxController {
  @override
  void onControllerInit() {
    super.onControllerInit();
    // To show splash screen in full screen mode.
    // This will hide status bar and navigation bar of system.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void onControllerReady() {
    super.onControllerReady();
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        // Back to the manual mode to show other
        // screens with status bar and navigation bar.
        await SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
        );
        if (SharedPref.getBool(PrefsKey.isLoggedIn, false)) {
          Get.offAllNamed(AppPaths.dashboard);
        } else {
          Get.offAllNamed(AppPaths.login);
        }
      },
    );
  }
}
