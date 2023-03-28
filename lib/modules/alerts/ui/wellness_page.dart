
import 'package:ssc_parent/utils/custom_drawer.dart';

import '../../../utils/exports.dart';

class WellnessPage extends BaseGetView<AlertsController> {
  const WellnessPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          // CustomAppBar(
          //   title: AppString.wellness.tr,
          //   onBackPressed: controller.onBackPressed,
          // ),
          AppBar(
              leading: IconButton(
                onPressed: () {
                  // toggleDrawer();
                },
                icon: Image.asset(Assets.images.icLogo.path),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today_rounded,
                    color: AppColors.yellowColor,
                  ),
                  onPressed: () {
                    // do something
                  },
                )
              ],
              backgroundColor: AppColors.primaryColor),
          const Placeholder(),

        ],
      ),
    );
  }

  @override
  String? getTag() => (WellnessPage).toString();
}
