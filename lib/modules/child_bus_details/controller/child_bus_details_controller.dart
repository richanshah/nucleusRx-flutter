import '../../../utils/exports.dart';

class ChildBusDetailsController extends BaseGetxController{
  late final DashboardController dashboardController;
  late final Map<String, String?> params;
  var isGeofencingEnabled = false.obs;
  var isCallsEnabled = true.obs;
  var isLiveMapEnabled = true.obs;
  var isHistoryEnabled = true.obs;

  @override
  void onControllerInit() {
    super.onControllerInit();
    params = Get.parameters;
    dashboardController = Get.find<DashboardController>(tag: (DashboardPage).toString());
  }

  void onBackPressed() {
    Get.back(id: 1);
    dashboardController.updateCurrentIndex();
  }

  void onGeofencingTap(){}

  void onCallTap(){}

  void onLiveMapTap(){}

  void onHistoryTap(){}
}