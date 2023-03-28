import '../../../utils/exports.dart';

class SettingsPage extends BaseGetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: AppString.settings.tr,
            onBackPressed: controller.onBackPressed,
          ),
          const Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (SettingsPage).toString();
}
