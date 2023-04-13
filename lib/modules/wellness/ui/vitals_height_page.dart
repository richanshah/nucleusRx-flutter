import 'package:numberpicker/numberpicker.dart';

import '../../../utils/exports.dart';

class HeightPage extends BaseGetView<HeightController> {
  HeightPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomAppBar(
              title: 'Vitals - Height',
              onBackPressed: controller.onBackPressed,
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  VerticalSpacer(
                    height: Dimens.padding12.h,
                  ),
                  Center(
                    child: Expanded(
                        flex: 2, child: vitalsHeightWidget(controller)),
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [ Obx(() =>
                        controller.selectedToggle.first
                            ? Align(
                            alignment: Alignment.center,
                            child: vitalsFtHeightWidget(controller))
                            : Align(
                            alignment: Alignment.center,
                            child: vitalsCmsHeightWidget(controller))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.primaryDarkColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(10.0),
                                  textStyle: const TextStyle(fontSize: 14),
                                ),
                                onPressed: () async {
                                  var value = controller.selectedToggle.first
                                      ? 'Ft In'
                                      : 'Cms';
                                  late var result;
                                  if (value == 'Ft In') {
                                    result = '${controller.heightFtValue
                                        .value}${controller.heightInValue
                                        .value}';
                                  }
                                  else {
                                    result = '${controller.heightValue.value}';
                                  }
                                  controller.showSnackBar(value:result);
                                },
                                child: const Text('Save'),
                              )),
                        ],
                      ),
                    ),
                  ),
                  VerticalSpacer(
                    height: Dimens.padding3.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String? getTag() => (HeightPage).toString();
}

Widget vitalsHeightWidget(HeightController controller) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.height, color: AppColors.primaryColor),
        Text(
          'Height',
          style: AppStyles.textMedium.copyWith(
            fontSize: Dimens.fontSize18.sp,
            color: AppColors.blueColor,
          ),
        ),
        Obx(() =>
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
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
      ],
    );

Widget vitalsCmsHeightWidget(HeightController controller) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Wrap(children: [
          NumberPicker(
              itemWidth: 50,
              itemHeight: 50,
              axis: Axis.vertical,
              decoration: const BoxDecoration(
                border: Border(
                  bottom:
                  BorderSide(width: 1.0, color: AppColors.darkGrayColor),
                ),
              ),
              value: controller.heightValue.value,
              minValue: controller.minValue.value,
              maxValue: controller.maxValue.value,
              onChanged: (value) => controller.heightValue.value = value),
        ])
      ],
    );

Widget vitalsFtHeightWidget(HeightController controller) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Wrap(children: [
          NumberPicker(
              itemWidth: 50,
              itemHeight: 50,
              axis: Axis.vertical,
              decoration: const BoxDecoration(
                border: Border(
                  bottom:
                  BorderSide(width: 1.0, color: AppColors.darkGrayColor),
                ),
              ),
              value: controller.heightFtValue.value,
              minValue: controller.minValue.value,
              maxValue: controller.maxValue.value,
              onChanged: (value) => controller.heightFtValue.value = value),
          VerticalSpacer(
            height: Dimens.padding4.h,
          ),
          NumberPicker(
              itemWidth: 50,
              itemHeight: 50,
              axis: Axis.vertical,
              decoration: const BoxDecoration(
                border: Border(
                  bottom:
                  BorderSide(width: 1.0, color: AppColors.darkGrayColor),
                ),
              ),
              value: controller.heightInValue.value,
              minValue: controller.minValue.value,
              maxValue: controller.maxValue.value,
              onChanged: (value) => controller.heightInValue.value = value),
        ])
      ],
    );
