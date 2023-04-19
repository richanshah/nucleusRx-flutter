import 'package:flutter_demo_richa/modules/settings/models/requests/settings_model.dart';

import '../../../utils/exports.dart';

class MessagesController extends BaseGetxController {
  /// use for setting notification item details
  late final SettingsModel settingsModel;


  @override
  void onControllerInit() {
    super.onControllerInit();
    settingsModel = (Get.arguments as Map<String, dynamic>)['settingsModel'] as SettingsModel;
    print('$settingsModel');

  /*  settingsModel = SettingsModel(
        title: 'Wellness screening',
        subTitle:
            'How often do you want to receive notifications for hydration/ water intake?',
        isOn: true,
        icon: Icons.data_exploration,
        id: 2);*/
  }

  void onBackPressed() {
    Get.back();
  }

  @override
  void onControllerReady() {
    super.onControllerReady();
  }
}
