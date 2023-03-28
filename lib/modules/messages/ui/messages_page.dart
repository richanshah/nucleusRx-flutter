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
  MessageWidget({Key? key, required this.model}) : super(key: key);
  final SettingsModel model;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  // late final SettingsModel model;
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  late final SettingsModel model;

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
    model = widget.model;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(Assets.images.icWellness.path),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                maxLines: 2,
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
            Align(
              alignment: Alignment.center,
              child: Text(
                // Text will be static as of now,
                // But in future we will remove and add
                // texts coming from apis.
                model.subTitle ?? '--',
                style: AppStyles.textSemiBold.copyWith(
                  fontSize: Dimens.fontSize20.sp,
                  color: AppColors.bodyTextColor.shade500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _selectTime,
          child: Text('SELECT TIME'),
        ),
        SizedBox(height: 8),
        Text(
          'Selected time: ${_time.format(context)}',
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryDarkColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () async {},
          child: const Text('Save'),
        )
      ],
    );
  }
}
