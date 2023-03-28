import '../../../utils/exports.dart';

class HomeController extends BaseGetxController
    with GetTickerProviderStateMixin {
  final dashboardController =
      Get.find<DashboardController>(tag: (DashboardPage).toString());
  late final TabController tabController;

  List<Tab> tabs() => [
        Tab(
          text: AppString.yourChild.tr,
          height: Dimens.tabHeight.h,
        ),
        Tab(
          text: AppString.busRoute.tr,
          height: Dimens.tabHeight.h,
        ),
      ];

  dynamic onTabTap(int position) {
    tabController.index = position;
  }

  @override
  void onControllerInit() {
    super.onControllerInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void onControllerReady() {
    super.onControllerReady();

    // Just Demo of how can we navigate users to specific screen if
    // they opens app using any post notification related things.
    // Make sure to store location before Navigator
    // is initialized in DashboardPage and replace it with
    // Get.currentRoute in below condition.
    if (dashboardController.desiredRoute != AppPaths.home) {
      DebugLog.i('Navigating to settings');
      // Get.toNamed is not working in Nested Navigation in GetX.
      // So we have to find some replacement for toNamed in nested.
      // It's open issue of GetX.
      // Get.toNamed(AppPaths.settings, id: 1);
      // So we use something like this..
      if (dashboardController.parameters != null &&
          dashboardController.parameters?.isNotEmpty == true) {
        Get.offNamedUntil(dashboardController.desiredRoute, (route) => true,
            id: 1,
            parameters: dashboardController.parameters as Map<String, String>?);
        return;
      }
      Get.offNamedUntil(
        dashboardController.desiredRoute,
        (route) => true,
        id: 1,
      );
    }
  }
}
