import '../../../utils/exports.dart';

class AlertsPage extends BaseGetView<AlertsController> {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: AppString.wellness.tr,
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
  String? getTag() => (AlertsPage).toString();
}
