import 'package:ssc_parent/modules/settings/models/requests/settings_model.dart';

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
                return Divider();
              },
              itemBuilder: (context, index) {
                SettingsModel settingModel=controller.settingItem.value[index];

                return SettingsListItem(
                  model: settingModel,
                  index: index,
                  onNextTap: (index) {
                    Get.dialog(
                      CustomDialog(
                        name: settingModel.title??'Demo',
                        nickName: settingModel.subTitle??'Nicknames',
                        description: AppString.areYouSureDeleteBusRoute.tr,
                        onNoTap: () {
                          Get.back();
                        },
                        onYesTap: () {
                          Get.back();
                        },
                      ),
                      navigatorKey: Get.nestedKey(null),
                      barrierDismissible: false,
                    );
                  },
                  onTap: (index){

                    // Get.toNamed(AppPaths.childBusDetails, id: 1,);
                  }, isOn: true,
                );
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (SettingsPage).toString();
}
