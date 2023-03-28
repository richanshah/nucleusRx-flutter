import '../../../../utils/exports.dart';

/// Customised Elevated Button to show prefix Icon in Elevated button.
///
/// Only use this button if there is need of any prefix Icon.
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key, this.onTap, this.prefixIcon, required this.drawablePadding, required this.text, required this.textStyle}) : super(key: key);

  /// Function to be triggered when user tap on button.
  final Function()? onTap;
  /// Prefix Icon to be shown in button.
  final Widget? prefixIcon;
  /// Padding between text and prefix Icon.
  final double drawablePadding;
  /// Text of button.
  final String text;
  /// TextStyle for text of button.
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        children: [
          prefixIcon ?? const SizedBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: prefixIcon != null ? drawablePadding : 0,
              ),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: false,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
