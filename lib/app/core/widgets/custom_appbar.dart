import '../../../utils/exports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.onBackPressed,
      this.showBackButton = true})
      : super(key: key);
  final String title;
  final Function()? onBackPressed;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leadingWidth: Dimens.appBarLeadingWidth.w,
      leading: showBackButton
          ? GestureDetector(
              onTap: onBackPressed ??
                  () {
                    Get.back();
                  },
              child: Assets.svgs.icBack.svg(
                height: Dimens.iconSizeRegular.w,
                allowDrawingOutsideViewBox: false,
                fit: BoxFit.none,
                color: AppColors.white
              ),
            )
          : const SizedBox(),
      title: Text(
        title,
        style: AppStyles.titleLarge.copyWith(fontSize: Dimens.fontSize20.sp),
      ),
    );
  }
}
