import '../../../utils/exports.dart';

class ChildListPage extends BaseGetView<ChildListController> {
  const ChildListPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ChildAndBusListItem(
                index: index,
                onDeleteTap: (index) {
                  Get.dialog(
                    CustomDialog(
                      name: 'JPBUS14',
                      nickName: 'Nicknames',
                      description: AppString.areYouSureDeleteChild.tr,
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
                onTap: (index){
                  Get.toNamed(AppPaths.childBusDetails, id: 1,);
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
            child: Text(
              AppString.addChild.tr,
            ),
          ),
        ),
      ],
    );
  }

  @override
  String? getTag() => (ChildListPage).toString();
}
