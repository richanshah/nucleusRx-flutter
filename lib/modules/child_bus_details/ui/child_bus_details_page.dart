import '../../../utils/exports.dart';

class ChildBusDetailsPage extends BaseGetView<ChildBusDetailsController> {
  const ChildBusDetailsPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Assets.images.detailsScreenBg.image().image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomAppBar(
              title: AppString.childView.tr,
              onBackPressed: controller.onBackPressed,
            ),
            const Expanded(
              child: ChildBusDetailsScrollablePart(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String? getTag() => (ChildBusDetailsPage).toString();
}