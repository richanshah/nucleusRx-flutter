import '../../../../utils/exports.dart';

/// Calendar week days widget.
///
/// Used to show calendar days like sun, mon, etc.
class CalendarDaysOfWeekWidget extends StatelessWidget {
  const CalendarDaysOfWeekWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.dayOfWeekHeight.h,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: Dimens.padding10.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.sun.tr,
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.mon.tr,
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.tues.tr,
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.wed.tr,
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.thurs.tr,
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.fri.tr,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding2.w),
              child: Text(
                AppString.sat.tr,
                textAlign: TextAlign.center,
                style: AppStyles.textMedium.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
