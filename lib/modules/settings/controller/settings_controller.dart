import '../../../utils/exports.dart';

class SettingsController extends BaseGetxController {
  late final DashboardController dashboardController;

  @override
  void onControllerInit() {
    super.onControllerInit();
    dashboardController = Get.find<DashboardController>(tag: (DashboardPage).toString());
  }

  void onBackPressed() {
    Get.back(id: 1);
    dashboardController.updateCurrentIndex();
  }
}