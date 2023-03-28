import '../../../utils/exports.dart';

class MessagesPage extends BaseGetView<MessagesController> {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: AppString.messages.tr,
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
  String? getTag() => (MessagesPage).toString();
}
