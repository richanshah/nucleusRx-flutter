import '../../../../utils/exports.dart';

class CalendarView extends BaseGetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Container(
      color: AppColors.calendarBackgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.padding10.w, vertical: Dimens.padding2.h),
      child: Obx(
            () => TableCalendar<CalendarEvent>(
          firstDay: DateTime(DateTime.now().year, DateTime.january, 1),
          lastDay: DateTime(DateTime.now().year, DateTime.december, 31),
          focusedDay: controller.focusedDay.value,
          daysOfWeekVisible: false,
          headerVisible: false,
          daysOfWeekStyle: DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
          ),
          daysOfWeekHeight: Dimens.dayOfWeekHeight.h,
          headerStyle: HeaderStyle(
            formatButtonShowsNext: true,
            decoration: BoxDecoration(color: AppColors.primary),
            headerMargin: EdgeInsets.only(bottom: Dimens.padding2.h),
            headerPadding: EdgeInsets.zero,
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronMargin: EdgeInsets.zero,
            leftChevronPadding: EdgeInsets.zero,
            rightChevronMargin: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
          ),
          selectedDayPredicate: (day) =>
              isSameDay(controller.selectedDay.value, day),
          calendarFormat: CalendarFormat.month,
          rangeSelectionMode: RangeSelectionMode.disabled,
          rowHeight: Dimens.calendarDayCellsRowHeight.h,
          eventLoader: controller.getEventsForDay,
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              final isOutside =
                  day.month != controller.focusedDay.value.month;

              // Whether it's outside day or not.
              //
              // if it's outside, we will not show any
              // events for that particular cell.
              if (isOutside) {
                return const SizedBox();
              }
              return CalendarMarkerWidget(day: day, events: events);
            },
          ),
          weekendDays: const [DateTime.sunday],
          startingDayOfWeek: StartingDayOfWeek.sunday,
          calendarStyle: CalendarStyle(
            // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: true,
            canMarkersOverflow: false,
            cellAlignment: Alignment.topLeft,
            cellMargin: EdgeInsets.all(1.w),
            defaultDecoration: BoxDecoration(color: AppColors.background),
            holidayDecoration: BoxDecoration(color: AppColors.background),
            selectedDecoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                    color: AppColors.calendarBackgroundColor,
                    blurRadius: 1)
              ],
              borderRadius: Dimens.radiusXXXXXXSmall.borderRadius,
              border: Border.all(
                color: AppColors.calendarCellBorderColor,
                width: Dimens.borderWidthMedium.w,
              ),
            ),
            todayDecoration: BoxDecoration(color: AppColors.background),
            weekendDecoration:
            BoxDecoration(color: AppColors.itemDifferenceColor),
            outsideDecoration: BoxDecoration(color: AppColors.background),
            cellPadding: EdgeInsets.all(Dimens.padding4.w),
            defaultTextStyle: AppStyles.textMedium
                .copyWith(fontSize: Dimens.fontSize14.sp),
            selectedTextStyle: AppStyles.textMedium
                .copyWith(fontSize: Dimens.fontSize14.sp),
            outsideTextStyle: AppStyles.textMedium.copyWith(
                fontSize: Dimens.fontSize14.sp,
                color: AppColors.inActiveGrayColor),
            weekendTextStyle: AppStyles.textMedium.copyWith(
                fontSize: Dimens.fontSize14.sp,
                color: AppColors.inActiveGrayColor),
            // tablePadding: EdgeInsets.symmetric(
            //     horizontal: Dimens.padding10.w, vertical: 1.h),
          ),
          onDaySelected: controller.onDaySelected,
          onPageChanged: (focusedDay) {
            controller.focusedDay.value = focusedDay;
          },
        ),
      ),
    );
  }

  @override
  String? getTag() => (MedSummaryPage).toString();
}
