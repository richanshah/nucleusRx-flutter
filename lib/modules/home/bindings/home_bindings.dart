
import '../../../utils/exports.dart';
class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), tag: (HomePage).toString());
    Get.put(DoseListController(), tag: (DoseListPage).toString());
    Get.put(TodayScheduleListController(), tag: (TodayScheduleListPage).toString());
    Get.put(WellnessController(), tag: (WellnessPage).toString());
    Get.put(ChangePasscodeController(), tag: (ChangePasscodePage).toString());
    Get.put(DashboardController(), tag: (DashboardPage).toString());
    Get.put(MedSummaryController(), tag: (MedSummaryPage).toString());
    Get.put(MedSummaryController(), tag: (MedSummaryDetailPage).toString());
    Get.put(DeviceDetailsController(), tag: (DeviceDetailsPage).toString());
    Get.put(UserDetailsController(), tag: (UserDetailsPage).toString());
    Get.put(SettingsController(), tag: (SettingsPage).toString());
  }
}