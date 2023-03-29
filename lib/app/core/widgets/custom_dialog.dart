import '../../../utils/exports.dart';

/// Customised Dialog to be used in [ChildListPage], [BusListPage], and as Confirmation.
///
/// As It's Confirmation dialog, this CustomDialog has two buttons with YES and NO buttons.
class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.description,
      this.name = '',
      this.nickName = '',
      required this.onNoTap,
      required this.onYesTap})
      : super(key: key);

  /// Description to be shown in top [Text] widget.
  final String description;

  /// Name of bus or child to be deleted.
  ///
  /// Don't provide value of this if you are
  /// using this dialog as simple confirmation dialog.
  /// For Example: logout confirmation.
  final String name;

  /// Nickname of bus or child to be deleted.
  ///
  /// Don't provide value of this if you are
  /// using this dialog as simple confirmation dialog.
  /// For Example: logout confirmation.
  final String nickName;

  /// Function to be triggered when user taps on No button.
  final Function() onNoTap;

  /// Function to be triggered when user taps on Yes button.
  final Function() onYesTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const ContinuousRectangleBorder(),
      backgroundColor: AppColors.surface,
      insetPadding: EdgeInsets.symmetric(
        vertical: Dimens.padding5.h,
        horizontal: Dimens.padding10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                top: Dimens.padding10.w,
                left: Dimens.padding20.w,
                right: Dimens.padding20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: AppStyles.textMedium.copyWith(
                      color: AppColors.onSurface,
                      fontSize: Dimens.fontSize24.sp,
                    ),
                  ),
                  VerticalSpacer(
                    height: Dimens.padding3.h,
                  ),
                  if (name.isNotNullOrEmpty) ...[
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: AppStyles.textMedium.copyWith(
                        color: AppColors.activeBlueColor,
                        fontSize: Dimens.fontSize22.sp,
                      ),
                    ),
                    VerticalSpacer(
                      height: Dimens.padding2.h,
                    ),
                  ],
                  if (nickName.isNotNullOrEmpty)
                    Text(
                      nickName,
                      textAlign: TextAlign.center,
                      style: AppStyles.textNormal.copyWith(
                        color: AppColors.inActiveGrayColor,
                        fontSize: Dimens.fontSize18.sp,
                      ),
                    ),
                ],
              ),
            ),
          ),
          VerticalSpacer(
            height: Dimens.padding5.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onNoTap,
                  style: Get.theme.textButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => states.contains(MaterialState.pressed)
                          ? AppColors.darkGrayColor
                          : AppColors.background,
                    ),
                    shape: MaterialStatePropertyAll(
                      ContinuousRectangleBorder(
                        side: BorderSide(
                          color: AppColors.appBarShadow,
                        ),
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: Dimens.padding10.h,
                        horizontal: Dimens.padding10.w,
                      ),
                    ),
                  ),
                  child: Text(
                    AppString.noInUpperCase.tr,
                    style: AppStyles.textBold.copyWith(
                      color: AppColors.redColor,
                      fontSize: Dimens.fontSize32.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onYesTap,
                  style: Get.theme.textButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => states.contains(MaterialState.pressed)
                          ? AppColors.itemDifferenceColor
                          : AppColors.darkGrayColor,
                    ),
                    shape: MaterialStatePropertyAll(
                      ContinuousRectangleBorder(
                        side: BorderSide(
                          color: AppColors.appBarShadow,
                        ),
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: Dimens.padding10.h,
                        horizontal: Dimens.padding10.w,
                      ),
                    ),
                  ),
                  child: Text(
                    AppString.yesInUpperCase.tr,
                    style: AppStyles.textBold.copyWith(
                      fontSize: Dimens.fontSize32.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
