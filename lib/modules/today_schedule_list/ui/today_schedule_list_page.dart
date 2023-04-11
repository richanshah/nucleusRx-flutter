import 'package:flutter/rendering.dart';
import 'package:flutter_demo_richa/modules/today_schedule_list/controller/controller.dart';
import 'package:flutter_demo_richa/modules/today_schedule_list/ui/widgets/today_scheudle_list_item.dart';

import '../../../utils/exports.dart';

class TodayScheduleListPage extends BaseGetView<TodayScheduleListController> {
  const TodayScheduleListPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomAppBar(
              title: 'Today’s dose schedule',
              onBackPressed: controller.onBackPressed,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TodayScheduleListItem(
                    showNextIcon: false,
                    index: index,
                  );
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 8,
                itemExtent: Dimens.childAndBusListItemHeight.h,
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  String? getTag() => (TodayScheduleListPage).toString();
}
