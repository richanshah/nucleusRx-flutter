import '../../../../utils/exports.dart';

/// Scrollable part of [ChildBusDetailsPage]
///
/// Includes ProfileImage, Descriptions and Buttons.
class ChildBusDetailsScrollablePart
    extends BaseGetView<ChildBusDetailsController> {
  const ChildBusDetailsScrollablePart({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalSpacer(
            height: Dimens.padding22.h,
          ),
          // Profile Image With Border.
          Container(
            decoration: BoxDecoration(
              borderRadius: Dimens.radiusXSmall.r.borderRadius,
              border: Border.all(
                color: AppColors.redColor,
                width: Dimens.padding8.w,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: ClipRRect(
              borderRadius: Dimens.radiusXSmall.r.borderRadius,
              child: Assets.images.detailsProfileImage.image(
                fit: BoxFit.fill,
                height: Dimens.childBusDetailsProfileHeight.h,
              ),
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding16.h,
          ),
          Text(
            "BRANDY COLE",
            textAlign: TextAlign.center,
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize22.sp,
              color: AppColors.activeBlueColor,
              decoration: TextDecoration.underline,
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding2.h,
          ),
          Text(
            "AT: FIRST START DAYCARE",
            textAlign: TextAlign.center,
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize18.sp,
              color: AppColors.bodyTextColor,
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding2.h,
          ),
          Text(
            "7:11AM AUGUST 15, 2022 \n1024 MAIN ST.",
            textAlign: TextAlign.center,
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize16.sp,
              color: AppColors.bodyTextColor,
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding2.h,
          ),
          Text(
            "NEW YORK, NY 21215",
            textAlign: TextAlign.center,
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize16.sp,
              color: AppColors.bodyTextColor,
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding13.h,
          ),
          const ChildBusDetailsCardWithButtons(),
        ],
      ),
    );
  }

  @override
  String? getTag() => (ChildBusDetailsPage).toString();
}
