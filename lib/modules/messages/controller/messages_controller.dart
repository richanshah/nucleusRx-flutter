import 'package:flutter_demo_richa/modules/settings/models/requests/settings_model.dart';

import '../../../utils/exports.dart';

class MessagesController extends BaseGetxController {
  late final DashboardController dashboardController;
  late final SettingsModel settingsModel;

  @override
  void onControllerInit() {
    super.onControllerInit();
    dashboardController =
        Get.find<DashboardController>(tag: (DashboardPage).toString());
    settingsModel = SettingsModel(
        title: 'Wellness screening',
        subTitle: 'How often do you want to receive notifications for hydration/ water intake?',
        isOn: true,
        icon: Icons.data_exploration,
        id: 2);
  }

  void onBackPressed() {
    Get.back(id: 1);
    dashboardController.updateCurrentIndex();
  }
}