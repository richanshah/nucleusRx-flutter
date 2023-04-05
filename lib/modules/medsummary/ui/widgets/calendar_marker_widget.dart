import '../../../../utils/exports.dart';

/// Widget to show events for the day in calendar.
///
/// This widget will show indicators up to 4.
class CalendarMarkerWidget extends StatelessWidget {
  const CalendarMarkerWidget(
      {Key? key, required this.day, required this.events})
      : super(key: key);
  final DateTime day;
  final List<CalendarEvent> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.padding4.w, vertical: Dimens.padding2.h),
      margin: EdgeInsets.all(1.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Here we are using text with transparent color.
          // As we are not overriding whole cell,
          // we just want to add vertical indicators below
          // date text to show events of the day.
          // So to start indicators below default text of day,
          // we are passing text widget with transparent color.
          Text(
            day.day.toString(),
            style: AppStyles.textMedium.copyWith(
              fontSize: Dimens.fontSize14.sp,
              color: Colors.transparent,
            ),
          ),
          VerticalSpacer(
            height: 1.h,
          ),
          Expanded(
            child: events.isNotEmpty
                ? CalendarEventIndicatorWidget(colorCode: events[0].colorCode)
                : const SizedBox(),
          ),
          Expanded(
            child: events.length > 1
                ? CalendarEventIndicatorWidget(colorCode: events[1].colorCode)
                : const SizedBox(),
          ),
          Expanded(
            child: events.length > 2
                ? CalendarEventIndicatorWidget(colorCode: events[2].colorCode)
                : const SizedBox(),
          ),
          Expanded(
            child: events.length > 3
                ? CalendarEventIndicatorWidget(colorCode: events[3].colorCode)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
