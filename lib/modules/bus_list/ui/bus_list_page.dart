import '../../../utils/exports.dart';

class BusListPage extends BaseGetView<BusListController> {
  const BusListPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return DoseListItem(
                index: index,
                onNextTap: (index) {
                  Get.dialog(
                    CustomDialog(
                      name: 'Dose Item Abc',
                      nickName: 'Nicknames',
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
              );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 20,
            itemExtent: Dimens.childAndBusListItemHeight.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.padding35.w, vertical: Dimens.padding15.h),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(AppString.addBusRoute.tr),
          ),
        ),
      ],
    );
  }

  @override
  String? getTag() => (BusListPage).toString();
}
