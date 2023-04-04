import 'package:flutter_demo_richa/modules/wellness/models/requests/vitals_model.dart';

import '../../../../utils/exports.dart';

class VitalsItemWidget extends StatelessWidget {
  const VitalsItemWidget(
      {Key? key, required this.model, required this.index, this.onTap})
      : super(key: key);

  /// Function to be called when user tap on item.
  ///
  /// Note: We have to add model in the parameters
  /// of this function same as position.
  final Function(int postion)? onTap;

  /// Index of the current item in the [ListView].
  final int index;

  /// This will be item of list which we will
  /// use to show data in this item widget.
  final VitalsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (onTap != null) {
          onTap!(index);
        }
      },
      child: Card(
        elevation: 3,
         /* margin: EdgeInsets.symmetric(
            horizontal: Dimens.padding25.w,
          ),*/
          child: Container(
            width: Dimens.vitalsDetailsCardWidth.w,
            height: Dimens.vitalsDetailsCardHeight.h,
            padding: EdgeInsets.all(Dimens.padding5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      model.icon??Icons.monitor_heart,
                      color: Colors.red,
                    ),
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
                    )
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child:   Text(
                        // Text will be static as of now,
                        // But in future we will remove and add
                        // texts coming from apis.
                        model.subTitle??'--',
                        style: AppStyles.textSemiBold.copyWith(
                          fontSize: Dimens.fontSize20.sp,
                          color: AppColors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),


                    ),
                    Text(
                      // Text will be static as of now,
                      // But in future we will remove and add
                      // texts coming from apis.
                      model.date??'--',
                      style: AppStyles.textLight.copyWith(
                        fontSize: Dimens.fontSize12.sp,
                        color: AppColors.lowOpacityTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
