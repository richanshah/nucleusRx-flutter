import '../../../../utils/exports.dart';

class DashboardBottomNavigationBar extends BaseGetView<DashboardController> {
  const DashboardBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: Dimens.bottomNavigationBarHeight.h,
        child: BottomNavigationBar(
          items: controller.navigationItemList(),
          onTap: controller.onNavigationItemClick,
          currentIndex: controller.currentIndex.value,
        ),
      ),
    );
  }

  @override
  String? getTag() => (DashboardPage).toString();
}
