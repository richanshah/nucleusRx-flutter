import '../../../../utils/exports.dart';

/// ChildBusDetailsPage's Card with 4 buttons.
///
/// includes buttons for geofencing, call, live map and history
class ChildBusDetailsCardWithButtons
    extends BaseGetView<ChildBusDetailsController> {
  const ChildBusDetailsCardWithButtons({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: Dimens.padding25.w,
      ),
      child: Container(
        width: Dimens.childBusDetailsCardWidth.w,
        height: Dimens.childBusDetailsCardHeight.h,
        padding: EdgeInsets.all(Dimens.padding5.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.padding5.w),
                      child: Obx(
                        () => CustomElevatedButton(
                          onTap: controller.isGeofencingEnabled.value ? controller.onGeofencingTap : null,
                          prefixIcon: Assets.svgs.icGeofancing.svg(
                            height: 21.5.h,
                            colorFilter: ColorFilter.mode(
                              controller.isGeofencingEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                              BlendMode.srcATop,
                            ),
                          ),
                          text: AppString.geofencing.tr,
                          drawablePadding: Dimens.padding5.w,
                          textStyle: AppStyles.textMedium.copyWith(
                            fontSize: Dimens.fontSize16.sp,
                            color: controller.isGeofencingEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.padding5.w),
                      child: Obx(
                        () => CustomElevatedButton(
                          onTap: controller.isCallsEnabled.value ? controller.onCallTap : null,
                          prefixIcon: Assets.svgs.icCall.svg(
                            height: 19.h,
                            colorFilter: ColorFilter.mode(
                              controller.isCallsEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                              BlendMode.srcATop,
                            ),
                          ),
                          text: AppString.callSchool.tr,
                          drawablePadding: Dimens.padding5.w,
                          textStyle: AppStyles.textMedium.copyWith(
                            fontSize: Dimens.fontSize16.sp,
                            color: controller.isCallsEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.padding5.w),
                      child: CustomElevatedButton(
                        onTap: controller.isLiveMapEnabled.value ? controller.onLiveMapTap : null,
                        prefixIcon: Assets.svgs.icMap.svg(
                          height: 20.h,
                          colorFilter: ColorFilter.mode(
                            controller.isLiveMapEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                            BlendMode.srcATop,
                          ),
                        ),
                        text: AppString.liveMap.tr,
                        drawablePadding: Dimens.padding5.w,
                        textStyle: AppStyles.textMedium.copyWith(
                          fontSize: Dimens.fontSize16.sp,
                          color: controller.isLiveMapEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.padding5.w),
                      child: CustomElevatedButton(
                        onTap: controller.isHistoryEnabled.value ? controller.onHistoryTap : null,
                        prefixIcon: Assets.svgs.icHistory.svg(
                          height: 18.h,
                          colorFilter: ColorFilter.mode(
                            controller.isHistoryEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                            BlendMode.srcATop,
                          ),
                        ),
                        text: AppString.history.tr,
                        drawablePadding: Dimens.padding5.w,
                        textStyle: AppStyles.textMedium.copyWith(
                          fontSize: Dimens.fontSize16.sp,
                          color: controller.isHistoryEnabled.value ? AppColors.activeBlueColor : AppColors.buttonInActiveColor,
                        ),
                      ),
                    ),
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
  String? getTag() => (ChildBusDetailsPage).toString();
}
