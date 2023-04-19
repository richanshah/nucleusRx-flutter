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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: const EdgeInsets.all(8),
                  leading:  const Icon(Icons.notification_important_rounded,color: AppColors.primaryColor),
                  minVerticalPadding: 20,
                  title:  Text( model.title ?? '--',
                      style: const TextStyle(color: AppColors.primaryColor)),
                  dense: true,
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          model.subTitle ?? '--',
                          style: const TextStyle(color: AppColors.primaryColor)),

                    ],
                  ),
                ),
              ),


            ],
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
