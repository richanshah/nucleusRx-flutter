
import 'package:flutter_demo_richa/modules/wellness/models/requests/vitals_model.dart';
import 'package:flutter_demo_richa/modules/wellness/ui/widgets/vitals_iteam.dart';
import 'package:flutter_demo_richa/utils/custom_drawer.dart';

import '../../../utils/exports.dart';
import '../../home/ui/widgets/wellness_card.dart';

class WellnessPage extends BaseGetView<WellnessController> {
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  WellnessCard(
                      title: 'Wellness screening',
                      subTitle: 'Take all your medications on time even if you feel good',
                      onTap: () { }),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        VitalsModel vitalsModel=controller.vitalsItem.value[index];

                        return VitalsItemWidget(
                          model: vitalsModel,
                          index: index,
                          onTap: (index){
                            Get.toNamed(AppPaths.messages, id: 1,arguments: vitalsModel);
                          },
                        );
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  String? getTag() => (WellnessPage).toString();
}
