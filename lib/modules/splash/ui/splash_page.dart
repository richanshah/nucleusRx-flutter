import '../../../utils/exports.dart';

class SplashPage extends BaseGetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          color: AppColors.primaryDarkColor,
          child: Column(
            children: [
              Expanded(
                  child: Center(child:   Assets.images.icSplash.image(
                    height: Dimens.listItemProfileImageHeight.h,
                    fit: BoxFit.fill,
                  ),))
            ],
          ),
        ),
      ),
    );
  }

  @override
  String? getTag() => (SplashPage).toString();
}
