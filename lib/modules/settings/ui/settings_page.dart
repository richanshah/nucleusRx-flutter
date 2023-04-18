import 'package:flutter_demo_richa/modules/settings/models/requests/settings_model.dart';

import '../../../utils/exports.dart';

class SettingsPage extends BaseGetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);


  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: MainAppBar(title: 'Notification reminder'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                SettingsModel settingModel=controller.settingItem.value[index];

                return SettingsListItem(
                  model: settingModel,
                  index: index,
                  onTap: (index){
                    Get.to(MessagesPage()/*,arguments:  {'settingModel': settingModel}*/);
                  }, isOn: settingModel.isOn??true,
                );
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.settingItem.value.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (SettingsPage).toString();
}
