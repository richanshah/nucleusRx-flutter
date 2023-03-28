import '../../../utils/exports.dart';

class VerticalSpacer extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? canShowSeparator;
  const VerticalSpacer(
      {Key? key, this.height, this.canShowSeparator, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: canShowSeparator ?? false
            ? Container(
                color: Colors.grey,
              )
            : Container());
  }
}
