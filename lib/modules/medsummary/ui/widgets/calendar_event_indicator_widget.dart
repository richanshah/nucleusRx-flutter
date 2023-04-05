import '../../../../utils/exports.dart';

/// Indicator of Events in Calendar.
class CalendarEventIndicatorWidget extends StatelessWidget {
  const CalendarEventIndicatorWidget({Key? key, required this.colorCode}) : super(key: key);
  final int colorCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      // Logic to set width of indicator as 60% of the cell width.
      width: ((MediaQuery.of(context).size.width - 26) / 7) * 0.6,
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: Dimens.radiusXXXXXXSmall.r.borderRadius,
      ),
    );
  }
}
