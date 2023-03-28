import '../../../utils/exports.dart';
import '../models/requests/settings_model.dart';

class SettingsController extends BaseGetxController {
  late final DashboardController dashboardController;
  late final RxList<SettingsModel> settingItem;
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
      /*    SettingsModel(title: 'Phone', icon: Icons.phone),
      SettingsModel(title: 'Camera', icon: Icons.camera_alt),
      SettingsModel(title: 'Setting', icon: Icons.settings),
      SettingsModel(title: 'Album', icon: Icons.photo_album),
      SettingsModel(title: 'WiFi', icon: Icons.wifi),
      SettingsModel(title: 'GPS', icon: Icons.gps_fixed),*/
    ].obs;
  }

  void onBackPressed() {
    Get.back(id: 1);
    dashboardController.updateCurrentIndex();
  }
}
