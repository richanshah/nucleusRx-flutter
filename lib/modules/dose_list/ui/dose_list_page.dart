import '../../../utils/exports.dart';

class DoseListPage extends BaseGetView<DoseListController> {
  const DoseListPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: MainAppBar(title: 'Dose time preference'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yellowButtonColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.snackbar("Add Button", "Clicked",
              colorText: Colors.white,
              backgroundColor: AppColors.yellowButtonColor,
              snackPosition: SnackPosition.BOTTOM,
              titleText: const Text("Add"));
        },
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return DoseListItem(
                  showNextIcon: true,
                  index: index,
                  onNextTap: (index) {
                    Get.dialog(
                      CustomDialog(
                        name: 'JPBUS14',
                        nickName: 'Nicknames',
                        description: AppString.areYouSureLogoutRoute.tr,
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
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (DoseListPage).toString();
}
