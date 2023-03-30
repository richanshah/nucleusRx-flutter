
import 'package:flutter_demo_richa/utils/custom_drawer.dart';

import '../../../utils/exports.dart';
import '../../home/ui/widgets/wellness_card.dart';

class WellnessPage extends BaseGetView<AlertsController> {
   WellnessPage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  toggleDrawer() async {
    if (scaffoldKey.currentState?.isDrawerOpen == true) {
      scaffoldKey.currentState?.closeDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }
  @override
  Widget buildView(BuildContext context) {

    return Scaffold(
      drawer:  CustomDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
              leading: IconButton(
                onPressed: () {
                  toggleDrawer();
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WellnessCard(
                  title: 'Wellness screening',
                  subTitle: 'Take all your medications on time even if you feel good',
                  onTap: () { }),
            ],
          ),
        ],
      ),
    );
  }


  @override
  String? getTag() => (WellnessPage).toString();
}
