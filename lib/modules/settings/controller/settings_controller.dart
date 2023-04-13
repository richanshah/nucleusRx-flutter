import '../../../utils/exports.dart';
import '../models/requests/settings_model.dart';

class SettingsController extends BaseGetxController {
  late final DashboardController dashboardController;
  late  RxList<SettingsModel> settingItem;
  @override
  void onControllerInit() {
    super.onControllerInit();
    dashboardController =
        Get.find<DashboardController>(tag: (DashboardPage).toString());
    settingItem = <SettingsModel>[
      SettingsModel(
          id: 1,
          title: 'Hydration',
          subTitle: 'Every 1 hour',
          icon: Icons.water_drop_outlined,
          isOn: true),
      SettingsModel(
          id: 2,
          title: 'Wellness screening',
          subTitle: 'Every day - 8:00 AM',
          icon: Icons.health_and_safety_outlined,
          isOn: true),
      SettingsModel(
          id: 3,
          title: 'Physical activity',
          subTitle: 'Every 1 hour',
          icon: Icons.map,
          isOn: true),
    ].obs;
  }

  void onBackPressed() {
    Get.back(id: 1);
    dashboardController.updateCurrentIndex();
  }
}
