

import 'package:flutter_demo_richa/modules/device_details/ui/widgets/device_widget.dart';
import 'package:flutter_demo_richa/utils/device_preferences.dart';

import '../../../utils/exports.dart';

class DeviceDetailsPage extends BaseGetView<DeviceDetailsController> {
  const DeviceDetailsPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: 'Device Details'),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: DeviceDetailsItem(),
          ),
        ));
  }

  @override
  String? getTag() => (DeviceDetailsPage).toString();


}
class DeviceDetailsItem extends StatefulWidget {
  const DeviceDetailsItem({Key? key}) : super(key: key);

  @override
  State<DeviceDetailsItem> createState() => _DeviceDetailsItemState();
}

class _DeviceDetailsItemState extends State<DeviceDetailsItem> {

  @override
  Widget build(BuildContext context) {
    final deviceItemList =DevicePreferences.myList;

    return  Column(
        children: [
          Flexible(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                DeviceDetailsWidget(
                    imagePath: Assets.images.icLogo.path,
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                      maxLines: 1,
                      'NRX Pill Dispenser',
                      style: TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                const CustomDividerSpacer(),
                buildDeviceItem(deviceItemList.elementAt(0)),
                const CustomDividerSpacer(),
                buildDeviceItem(deviceItemList.elementAt(1)),
                const CustomDividerSpacer(),
                buildDeviceItemWithNext(deviceItemList.elementAt(2)),
                const CustomDividerSpacer(),
              ],
            ),
          ),
        ],
      );
  }

  Widget buildDeviceItem(Device device) => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          device.label,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          device.value,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );


  Widget buildDeviceItemWithNext(Device device) => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          device.label,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
        const SizedBox(height: 4),
        IconButton(icon: const Icon(Icons.navigate_next),color: AppColors.labelGrimGreyColor,onPressed: (){
        }),
      ],
    ),
  );




}

class CustomDividerSpacer extends StatelessWidget {
  const CustomDividerSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 12),
        Divider(height: 4),
        SizedBox(height: 12)
      ],
    );
  }
}


