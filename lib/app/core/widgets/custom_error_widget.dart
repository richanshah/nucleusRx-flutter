
import '../../../utils/exports.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? message;

  const CustomErrorWidget({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message ?? 'something_went_wrong'.tr,
          style: Get.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
