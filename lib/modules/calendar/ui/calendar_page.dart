import '../../../utils/exports.dart';
import 'package:intl/intl.dart';

class CalendarPage extends BaseGetView<CalendarController> {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => CustomAppBar(
              title:
                  DateFormat('MMMM yyyy').format(controller.focusedDay.value),
              onBackPressed: controller.onBackPressed,
            ),
          ),
          const CalendarDaysOfWeekWidget(),
          const CalendarView(),
          AppBar(
            toolbarHeight: Dimens.appBarHeight.h,
            leading: const SizedBox(),
            leadingWidth: 0,
            centerTitle: true,
            elevation: 5,
            shadowColor: AppColors.shadow,
            title: Text(
              DateFormat('EEEEE, MMM dd, yyyy')
                  .format(controller.focusedDay.value),
              style: AppStyles.titleLarge.copyWith(
                fontSize: Dimens.fontSize20.sp,
              ),
            ),
          )
          // Expanded(
          //   child: ValueListenableBuilder<List<Event>>(
          //     valueListenable: _selectedEvents,
          //     builder: (context, value, _) {
          //       return ListView.builder(
          //         itemCount: value.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             margin: const EdgeInsets.symmetric(
          //               horizontal: 12.0,
          //               vertical: 4.0,
          //             ),
          //             decoration: BoxDecoration(
          //               border: Border.all(),
          //               borderRadius: BorderRadius.circular(12.0),
          //             ),
          //             child: ListTile(
          //               onTap: () => print('${value[index]}'),
          //               title: Text('${value[index]}'),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (CalendarPage).toString();
}
