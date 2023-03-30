import '../../../utils/exports.dart';

class DashboardPage extends BaseGetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        body: Navigator(
          onPopPage: (p0, p1) => p0.didPop(p1),
          initialRoute: AppPaths.home,
          // Needed to update Get.currentRoute and Get.previousRoute as per
          // this nested navigator.
          observers: [
            GetObserver((p0) {}, Get.routing),
          ],
          onGenerateRoute: (settings) {
            return controller.onGenerateRoute(settings, context);
          },
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (context) => HomePage()),
          key: Get.nestedKey(1),
        ),
        bottomNavigationBar: const DashboardBottomNavigationBar(),
      ),
    );
  }

  @override
  String? getTag() => (DashboardPage).toString();
}
