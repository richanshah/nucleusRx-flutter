import '../../../../utils/exports.dart';

/// Creates RichText with clickable Register
/// substring among the whole string(text).
class RegisterRichText extends StatelessWidget {
  const RegisterRichText({Key? key, required this.onRegisterTap}) : super(key: key);
  final void Function() onRegisterTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      maxLines: 2,
      text: TextSpan(
        text: AppString.doNotHaveAccount.tr,
        style: AppStyles.textNormal
            .copyWith(fontSize: Dimens.fontSize18.sp),
        children: <TextSpan>[
          TextSpan(
            text: ' ${AppString.register.tr}',
            recognizer: TapGestureRecognizer()
              ..onTap = onRegisterTap,
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize18.sp,
              color: AppColors.activeBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
