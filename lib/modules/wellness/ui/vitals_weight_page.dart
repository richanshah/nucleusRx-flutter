import 'dart:math';

import '../../../utils/exports.dart';

class WeightPage extends BaseGetView<WellnessController> {
  WeightPage({Key? key}) : super(key: key);

  /* toggleDrawer() async {
    if (scaffoldKey.currentState?.isDrawerOpen == true) {
      scaffoldKey.currentState?.closeDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }*/
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomAppBar(
              title: 'Wellness screening',
              onBackPressed: controller.onBackPressed,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  VerticalSpacer(
                    height: Dimens.padding12.h,
                  ),
                  vitalsWeightWidget(controller),
                  vitalsEditorWeightWidget(controller),
                  VerticalSpacer(
                    height: Dimens.padding3.h,
                  ),
                  // vitalsEditorWeightWidget(controller),

                  Expanded(
                    flex: 6,
                    child: Obx(() =>
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemBuilder: (context, index) {
                            late List? filteredList = controller.weightModel
                                .value
                                .where((item) => item != null && item != '' &&
                                item.type == ( controller.selectedToggle.first==true ? 'Kg' : 'Lbs'))
                                .toList() ?? controller.weightModel.value;
                            WeightModel weightModel =
                                controller.weightModel.value[index];
                            return WeightItemWidget(
                              model: weightModel,
                              index: index,
                              onTap: (index) {},
                            );
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.weightModel.length,
                        )),
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

Widget vitalsWeightWidget(WellnessController controller) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.monitor_weight_sharp, color: AppColors.primaryColor),
        Text(
          'Weight',
          style: AppStyles.textMedium.copyWith(
            fontSize: Dimens.fontSize18.sp,
            color: AppColors.blueColor,
          ),
        ),
        Obx(() =>
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                // The button that is tapped is set to true, and the others to false.
                /* for (int i = 0; i < controller.selectedToggle.length; i++) {
                      controller.selectedToggle[i] = i == index;
                    }*/

                controller.changeTabIndex(index);
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: AppColors.lightGrayColor,
              selectedColor: AppColors.lightGrayColor,
              fillColor: Colors.white,
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 30.0,
                minWidth: 60.0,
              ),
              isSelected: controller.selectedToggle.toList(),
              children: controller.toggleItem.toList(),
            )),
        /*   Switch(
            onChanged: controller.isKgsSelected,
            value: controller.kgsOrLbs.value,
            activeColor: Colors.blue,
            activeTrackColor: Colors.yellow,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.orange,
          ),*/
      ],
    );

Widget vitalsEditorWeightWidget(WellnessController controller) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 80.w,
          height: 60.h,
          child: TextFormField(
              controller: controller.weightValueController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkGrayColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkGrayColor))),
              keyboardType: TextInputType.number,
              maxLength: 10,
              autovalidateMode: AutovalidateMode.always,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              onChanged: (inputValue) {
                /*  if (inputValue.isEmpty ||
                                        inputValue.characters.length < 10) {
                                      setValidator(true);
                                    } else {
                                      setValidator(false);
                                    }*/
              }),
        ),
       Obx(() => Text(
         controller.selectedToggle.first==true ? 'Kg' : 'Lbs',
         style: AppStyles.textMedium.copyWith(
           fontSize: Dimens.fontSize18.sp,
           color: AppColors.blueColor,
         ),
       )) ,
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryDarkColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () async {
            controller.addToList(WeightModel(id: 11,
                title: controller.weightValueController.text,
                date: '21 March',
                type:  controller.selectedToggle.first==true ? 'Kg' : 'Lbs'));
                // controller.onBackPressed();
                },
          child: const Text('Add'),
        ),
      ],
    );
