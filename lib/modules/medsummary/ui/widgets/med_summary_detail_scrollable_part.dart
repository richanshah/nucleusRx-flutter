import '../../../../utils/exports.dart';

/// Scrollable part of [MedSummaryDetailsPage]
///
/// Includes ProfileImage, Descriptions and Buttons.
class MedSummaryDetailsScrollablePart
    extends BaseGetView<MedSummaryController> {
  const MedSummaryDetailsScrollablePart({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          VerticalSpacer(
            height: Dimens.padding22.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "budesonide",
                textAlign: TextAlign.start,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize22.sp,
                  color: AppColors.activeBlueColor,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Icon(
                // Assets.images.icShare.path,
                Icons.medication,
              )
            ],
          ),
          VerticalSpacer(
            height: Dimens.padding4.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "40 mg",
              textAlign: TextAlign.left,
              style: AppStyles.textMedium.copyWith(
                fontSize: Dimens.fontSize18.sp,
                color: AppColors.bodyTextColor,
              ),
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Once a day",
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                  color: AppColors.bodyTextColor,
                ),
              ),
              SvgPicture.asset(
                // Assets.images.icShare.path,
                Assets.svgs.icPdd,
                height: 20,
                fit: BoxFit.contain,
              )
            ],
          ),
          VerticalSpacer(
            height: Dimens.padding2.h,
          ),
          Text(
            "Take 40 mg capsule by mouth once a day take 30 minutes before breakfast. This will replace the Pantoprazole & the Rx Dexilant.",
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize16.sp,
              color: AppColors.bodyTextColor,
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding13.h,
          ),
          buildAdherenceItemWithNext(),
          VerticalSpacer(
            height: Dimens.padding13.h,
          ),
          buildRefillItemWithNext(),
          VerticalSpacer(
            height: Dimens.padding13.h,
          ),
        ],
      ),
    );
  }

  Widget buildAdherenceItemWithNext() => Container(
    height: 65,
    width: double.infinity,
      decoration: BoxDecoration(
       color: AppColors.backgroundColor.withOpacity(0.5),
      ),
    child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Adherence',
              style: AppStyles.textSemiBold.copyWith(
                fontSize: Dimens.fontSize16.sp,
                color: AppColors.bodyTextColor,
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  Text(
                    ' 60%',
                    style: AppStyles.textSemiBold.copyWith(
                      fontSize: Dimens.fontSize16.sp,
                      color: AppColors.bodyTextColor,
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.navigate_next),
                      color: AppColors.labelGrimGreyColor,
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
  );

  Widget buildRefillItemWithNext() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Last refill date',
            style: AppStyles.textLight.copyWith(
              fontSize: Dimens.fontSize16.sp,
              color: AppColors.bodyTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Pills left',
            style: AppStyles.textLight.copyWith(
              fontSize: Dimens.fontSize16.sp,
              color: AppColors.bodyTextColor,
            ),
          ),
          Text(
            'More',
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize16.sp,
              color: AppColors.blueColor,
            ),
          )
        ],
      );

  @override
  String? getTag() => (MedSummaryDetailPage).toString();
}
