import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../service/notification/notification_service.dart';
import '../../../utils/exports.dart';
import '../../settings/models/requests/settings_model.dart';

class MessagesPage extends BaseGetView<MessagesController> {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: AppString.messages.tr,
            onBackPressed: controller.onBackPressed,
          ),
          Expanded(
            child: MessageWidget(model: controller.settingsModel),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (MessagesPage).toString();
}

class MessageWidget extends StatefulWidget {
  const MessageWidget({Key? key, required this.model}) : super(key: key);
  final SettingsModel model;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  // late final SettingsModel model;
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);
  late final SettingsModel model;
  late final NotificationService notificationService;

  @override
  void initState() {
    model = widget.model;
    notificationService = NotificationService();
    listenToNotificationStream();
    notificationService.initializePlatformNotifications();
    super.initState();
  }

  void listenToNotificationStream() =>
      notificationService.behaviorSubject.listen((payload) {
        print("notification received$payload");
      });

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(Assets.images.icWellness.path),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      model.title ?? '--',
                      style: AppStyles.textNormal.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Text will be static as of now,
                    // But in future we will remove and add
                    // texts coming from apis.
                  ],
                ),
              ),

            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  maxLines: 2,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  // Text will be static as of now,
                  // But in future we will remove and add
                  // texts coming from apis.
                  model.subTitle ?? '--',
                  style: AppStyles.textNormal.copyWith(
                    fontSize: Dimens.fontSize16.sp,
                    color: AppColors.bodyTextColor.shade400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _selectTime,
          child: const Text('Select Time'),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Selected time: ${_time.format(context)}',
          ),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryDarkColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () async {
            await notificationService.showPeriodicLocalNotification(
                id: 1,
                title: model.title??"Drink Water Periodic ",
                body: model.subTitle??"Time to drink some water!",
                payload: "You just took water! Huurray!",repeatInterval: RepeatInterval.hourly);
            await notificationService.showGroupedNotifications(title: 'Drink Water');
       /*     await notificationService.showScheduledLocalNotification(
                id: 0,
                title: "Drink Water",
                body: "Time to drink some water!",
                payload: "You just took water! Huurray!", seconds: 10);*/
          },
          child: const Text('Save'),
        )
      ],
    );
  }
}
