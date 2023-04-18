import 'package:flutter_demo_richa/modules/settings/models/requests/settings_model.dart';

import '../../../utils/exports.dart';

class MessagesController extends BaseGetxController {
  /// use for setting notification item details
  late final SettingsModel settingsModel;
  late final int args;

  /// For checking where user comes from
  bool isFromLoginScreen = true;

  @override
  void onControllerInit() {
    super.onControllerInit();

  /*  settingsModel = SettingsModel(
        title: 'Wellness screening',
        subTitle:
            'How often do you want to receive notifications for hydration/ water intake?',
        isOn: true,
        icon: Icons.data_exploration,
        id: 2);*/
  }

  void onBackPressed() {
    Get.back(id: 1);
  }

  @override
  void onControllerReady() {
    super.onControllerReady();
    settingsModel = (Get.parameters)['settingsModel'] as SettingsModel;
    // print('$settingsModel');
 /*   isFromLoginScreen = Get.parameters['isFromLogin'] == 'true';
    print('$isFromLoginScreen');*/
  }
}
