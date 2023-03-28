import '../../../../utils/exports.dart';

class ChildAndBusListItem extends StatelessWidget {
  const ChildAndBusListItem(
      {Key? key,
      required this.index,
      this.showDeleteIcon = true,
      this.onTap,
      this.onDeleteTap})
      : super(key: key);

  /// Index of the current item in the [ListView].
  final int index;

  /// This will be item of list which we will
  /// use to show data in this item widget.
  // final Object model;

  /// Whether to show delete Icon at the bottom or not.
  final bool showDeleteIcon;

  /// Function to be called when user tap on item.
  ///
  /// Note: We have to add model in the parameters
  /// of this function same as position.
  final Function(int postion)? onTap;

  /// Function to be called when user tap on delete icon.
  ///
  /// Note: We have to add model in the parameters
  /// of this function same as position.
  final Function(int postion)? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        }
      },
      child: Container(
        height: Dimens.childAndBusListItemHeight.h,
        color: (index + 1).isOdd
            ? AppColors.background
            : AppColors.itemDifferenceColor,
        padding: EdgeInsets.only(
          bottom: Dimens.padding5.h,
          top: Dimens.padding5.h,
          right: Dimens.padding5.w,
          left: Dimens.padding5.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              thickness: Dimens.listItemStatusIndicatorWidth.w,
              width: Dimens.listItemStatusIndicatorWidth.w,
              // This will be changed based on status
              // type getting from response of api
              color: AppColors.yellowColor,
            ),
            // This will be also changed to the CachedNetworkImage and will load
            // image url getting from response of api
            Assets.images.profileImage.image(
              height: Dimens.listItemProfileImageHeight.h,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimens.padding10.w,
                  Dimens.padding2.h,
                  Dimens.padding10.w,
                  Dimens.padding2.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      'BRANDON COLE, JR.'.toUpperCase(),
                      style: AppStyles.textMedium.copyWith(
                        fontSize: Dimens.fontSize20.sp,
                        color: AppColors.activeBlueColor,
                        decoration: TextDecoration.underline,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      'ON BUS: GBLUE17'.toUpperCase(),
                      style: AppStyles.textMedium.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      '7:11AM 8/11/2022'.toUpperCase(),
                      style: AppStyles.textMedium.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      '1024 MAIN ST'.toUpperCase(),
                      style: AppStyles.textMedium.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Text will be static as of now,
                    // But in future we will remove and add
                    // texts coming from apis.
                    Text(
                      'NEW YORK, NY 12122'.toUpperCase(),
                      style: AppStyles.textMedium.copyWith(
                        fontSize: Dimens.fontSize16.sp,
                        color: AppColors.bodyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: showDeleteIcon
                  ? GestureDetector(
                      onTap: () {
                        // Here we can add model as well in parameters
                        if (onDeleteTap != null) {
                          onDeleteTap!(index);
                        }
                      },
                      child: Container(
                        color: (index + 1).isOdd
                            ? AppColors.background
                            : AppColors.itemDifferenceColor,
                        padding: EdgeInsets.only(
                          top: Dimens.padding4.w,
                          bottom: Dimens.padding15.w,
                          left: Dimens.padding15.w,
                          right: Dimens.padding15.w,
                        ),
                        child: Assets.svgs.icDeleteRed.svg(
                          height: Dimens.listItemDeleteIconHeight.h,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
