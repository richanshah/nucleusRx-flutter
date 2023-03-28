import '../../../utils/exports.dart';

/// Customized version of [TextFormField].
///
/// Customized [TextFormField] as per this app's
/// designs requirement.
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.formFieldKey,
    this.focusNode,
    this.controller,
    this.enabled,
    this.onTapOutSide,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.obscureText = false,
    this.textInputAction,
    required this.labelText,
    this.suffixIconConstraints,
    this.suffixIcon,
    this.onChange,
    this.validator,
    this.cursorColor,
    this.isPasswordField = false,
    this.onSuffixIconTap,
  }) : super(key: key);
  final GlobalKey<FormFieldState>? formFieldKey;
  /// Used to check and request for Focus
  /// for the [TextFormField].
  final FocusNode? focusNode;
  /// To access text typed by user in [TextFormField]
  /// [TextEditingController] is Required.
  final TextEditingController? controller;
  /// Whether [TextFormField] is Enabled or Disabled.
  final bool? enabled;
  /// Triggers when user tap outside of [TextFormField].
  final Function(PointerDownEvent event)? onTapOutSide;

  final List<TextInputFormatter>? inputFormatters;
  /// Input types to tell keyboard that
  /// which type of keyboard UI should open.
  ///
  /// like if [TextInputType.phone] is given then it only shows
  /// keyboard with numbers and some special characters.
  final TextInputType? keyboardType;
  /// Max length for the text in [TextFormField].
  final int? maxLength;
  /// Max lines for the text in [TextFormField].
  ///
  /// Defaults to 1 when [isPasswordField] is true.
  final int? maxLines;
  /// Required when [isPasswordField] is true.
  ///
  /// Must Handle value of this in [onSuffixIconTap]
  /// to show and hide text in [TextFormField]
  final bool obscureText;
  /// [TextInputAction] used by keyboard to move
  /// focus on next [FocusNode] and etc.
  final TextInputAction? textInputAction;
  /// Label text is required.
  final String labelText;
  /// BoxConstraints for the suffix icon.
  ///
  /// default constraints are managed here if [isPasswordField] is true.
  final BoxConstraints? suffixIconConstraints;
  /// Suffix Icon to add any actions.
  /// like password show and hide.
  ///
  /// default suffix icon is managed here if [isPasswordField] is true
  /// and not provided any suffix icon.
  /// But [onSuffixIconTap] is required as we are not managing state here.
  final Widget? suffixIcon;
  /// Function which will triggered whenever changes happens.
  final Function(String value)? onChange;
  /// Validator function required to perform validations.
  final FormFieldValidator<String>? validator;
  /// Color of cursor.
  /// defaults to [AppColors.activeBlueColor].
  final Color? cursorColor;
  /// Whether is Password field or normal field.
  final bool isPasswordField;
  /// Required if [isPasswordField] is true.
  final Function()? onSuffixIconTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      key: formFieldKey,
      focusNode: focusNode,
      controller: controller,
      style: AppStyles.textNormal.copyWith(fontSize: Dimens.fontSize16.sp, height: Dimens.textHeightXLarge.h, color: AppColors.onBackground),
      enabled: enabled,
      onTapOutside: onTapOutSide,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: isPasswordField ? 1 : maxLines,
      obscureText: isPasswordField ? obscureText : false,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIconConstraints: isPasswordField
            ? suffixIconConstraints ?? const BoxConstraints.tightForFinite()
            : suffixIconConstraints ?? const BoxConstraints.tightFor(),
        // Here we have logic to add default
        // show and hide icon if [isPasswordField] is true.
        suffixIcon: GestureDetector(
          onTap: onSuffixIconTap,
          child: isPasswordField
              ? suffixIcon ??
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.padding10.w,
                        vertical: Dimens.padding6.h),
                    child: Text(
                      obscureText ? AppString.show.tr : AppString.hide.tr,
                      style: AppStyles.textNormal.copyWith(
                          fontSize: Dimens.fontSize14.sp,
                          color: AppColors.inActiveGrayColor),
                    ),
                  )
              : suffixIcon ?? const SizedBox(),
        ),
      ),
      onChanged: onChange,
      validator: validator,
      cursorColor: cursorColor ?? AppColors.activeBlueColor,
    );
  }
}
