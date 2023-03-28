import '../../../utils/exports.dart';

class AdsWrapperWidget extends StatelessWidget {
  const AdsWrapperWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Assets.banners.adsBanner.image(
            height: 100.h,
            width: 375.w,
            fit: BoxFit.fill,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
