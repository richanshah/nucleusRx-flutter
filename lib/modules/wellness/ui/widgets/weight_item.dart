import '../../../../utils/exports.dart';

class WeightItemWidget extends StatelessWidget {
  const WeightItemWidget(
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
  final WeightModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        }
      },
      child: Container(
        width: double.infinity,
        height: Dimens.weightDetailsCardHeight.h,
        padding: EdgeInsets.all(Dimens.padding8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                // Text will be static as of now,
                // But in future we will remove and add
                // texts coming from apis.
                '${model.title!} ${model.type}'??'Kg' ,
                style: AppStyles.textNormal.copyWith(
                  fontSize: Dimens.fontSize16.sp,
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                // Text will be static as of now,
                // But in future we will remove and add
                // texts coming from apis.
                model.date ?? '--',
                style: AppStyles.textLight.copyWith(
                  fontSize: Dimens.fontSize12.sp,
                  color: AppColors.lowOpacityTextColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
