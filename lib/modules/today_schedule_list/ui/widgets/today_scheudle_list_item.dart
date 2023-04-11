import '../../../../utils/exports.dart';

class TodayScheduleListItem extends StatelessWidget {
  const TodayScheduleListItem(
      {Key? key,
      required this.index,
      this.showNextIcon = true,
      this.onTap,
      this.onNextTap})
      : super(key: key);

  /// Index of the current item in the [ListView].
  final int index;

  /// This will be item of list which we will
  /// use to show data in this item widget.
  // final Object model;

  /// Whether to show next Icon at the bottom or not.
  final bool showNextIcon;

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
        height: 500,
        padding: EdgeInsets.only(
          bottom: Dimens.padding5.h,
          top: Dimens.padding5.h,
          right: Dimens.padding5.w,
          left: Dimens.padding5.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            // Text will be static as of now,
                            // But in future we will remove and add
                            // texts coming from apis.
                            '7:11',
                            style: AppStyles.textNormal.copyWith(
                              fontSize: Dimens.fontSize16.sp,
                              color: AppColors.bodyTextColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          VerticalSpacer(
                            height: Dimens.padding2.h,
                          ),
                          Text('AM',
                              style: AppStyles.textLight.copyWith(
                                fontSize: Dimens.fontSize16.sp,
                                color: AppColors.bodyTextColor,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ],
                      ),
                      Text(
                        // Text will be static as of now,
                        // But in future we will remove and add
                        // texts coming from apis.
                        'Noon',
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
                Align(
                  alignment: Alignment.centerRight,
                  child: showNextIcon
                      ? GestureDetector(
                          onTap: () {
                            // Here we can add model as well in parameters
                            if (onNextTap != null) {
                              onNextTap!(index);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              top: Dimens.padding4.w,
                              bottom: Dimens.padding15.w,
                              left: Dimens.padding15.w,
                              right: Dimens.padding15.w,
                            ),
                            child: Icon(Icons.navigate_next,color: AppColors.darkGrayColor,),
                          ),
                        )
                      : const SizedBox(),

                ),

              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  physics:  ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                    ) ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             mainAxisSize: MainAxisSize.min,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Icon(Icons.tablet,color: AppColors.primaryColor),
                               VerticalSpacer(height: Dimens.padding4.w),
                               Expanded(
                                 child: Column(
                                   mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       // Text will be static as of now,
                                       // But in future we will remove and add
                                       // texts coming from apis.
                                       'durezol',
                                       style: AppStyles.textMedium.copyWith(
                                         fontSize: Dimens.fontSize16.sp,
                                         color: AppColors.black,
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                     ),
                                     VerticalSpacer(
                                       height: Dimens.padding2.h,
                                     ),
                                     Text('40 mg  |   1 pill ',
                                         style: AppStyles.textNormal.copyWith(
                                           fontSize: Dimens.fontSize14.sp,
                                           color: AppColors.labelGrimGreyColor,
                                           overflow: TextOverflow.ellipsis,
                                         ))


                                   ],
                                 ),
                               )
                             ],
                          ),
                        ),
                      );

                  }),
            ),
          ],

        ),

      ),
    );
  }
}
