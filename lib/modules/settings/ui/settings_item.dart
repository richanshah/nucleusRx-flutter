import 'package:ssc_parent/modules/settings/models/requests/settings_model.dart';

import '../../../../utils/exports.dart';

class SettingsListItem extends StatelessWidget {
   SettingsListItem(
      {Key? key,
      required this.model,
      required this.index,
      required this.isOn,
      this.onTap,
      this.onNextTap})
      : super(key: key);

  /// Index of the current item in the [ListView].
  final int index;

  /// This will be item of list which we will
  /// use to show data in this item widget.
  final SettingsModel model;

  bool isOn = true;


  /// Function to be called when user tap on item.
  ///
  /// Note: We have to add model in the parameters
  /// of this function same as position.
  final Function(int postion)? onTap;

  /// Function to be called when user tap on next icon.
  ///
  /// Note: We have to add model in the parameters
  /// of this function same as position.
  final Function(int postion)? onNextTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        }
      },
      child: Container(
        height: Dimens.childAndDoseListItemHeight.h,
        padding: EdgeInsets.only(
          bottom: Dimens.padding5.h,
          top: Dimens.padding5.h,
          right: Dimens.padding5.w,
          left: Dimens.padding5.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(Assets.images.icWellness.path)??Icon(model.icon??Icons.add),
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
                      model.title??'--',
                      style: AppStyles.textNormal.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      model.subTitle??'--',
                      style: AppStyles.textNormal.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor.shade400,
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
              alignment: Alignment.centerRight,
              child: Switch(
                // This bool value toggles the switch.
                value: model.isOn!,
                activeColor: AppColors.primaryColor,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  model.isOn=!value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
