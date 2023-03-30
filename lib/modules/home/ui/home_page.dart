import 'package:flutter_demo_richa/modules/dashboard/ui/widgets/custom_card.dart';

import '../../../utils/exports.dart';
import '../../dashboard/ui/widgets/dose_card.dart';
import '../../dashboard/ui/widgets/home_card.dart';

class HomePage extends BaseGetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

/*  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          height: Dimens.tabHeight.h,
          tabs: controller.tabs(),
          onTap: controller.onTabTap,
          tabController: controller.tabController,
        ),
        Expanded(
          // Check that how we can move this tab view as navigation component
          // do it in last as as per the tabs behaviour is should not be like
          // Navigation

          // Or Move it in another separate view
          child: TabBarView(
            controller: controller.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              // Create another one module for BusRoute listing
              ChildListPage(),
              BusListPage(),
            ],
          ),
        ),
      ],
    );
  }*/
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      drawer:  CustomDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        /*  MainAppBar(
            title: AppString.home.tr,
          ),*/
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeCard(
                    title: 'Wellness screening',
                    subTitle: 'Take all your medications on time even if you feel good',
                    onTap: () {}),

                // Stack(
                //   alignment: Alignment.topLeft,
                //   children: [
                //
                //     CustomCard(
                //         title: 'Load medications',
                //         subTitle: 'Please complete medication setup',
                //         onTap: () {}),
                //     CustomCard(
                //         title: 'Load medications',
                //         subTitle: 'Please complete medication setup',
                //         onTap: () {}),
                //     CustomCard(
                //         title: 'Load medications',
                //         subTitle: 'Please complete medication setup',
                //         onTap: () {}),
                //     CustomCard(
                //         title: 'Load medications',
                //         subTitle: 'Please complete medication setup',
                //         onTap: () {}),
                //     CustomCard(
                //         title: 'Load medications',
                //         subTitle: 'Please complete medication setup',
                //         onTap: () {}),
                //   ],
                // ),

                DoseCard(
                    title: 'Wellness screening',
                    subTitle: 'Take all your medications on time even if you feel good',
                    onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (HomePage).toString();
}
