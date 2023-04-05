import '../../../utils/exports.dart';

class MedSummaryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MedSummaryController(), tag: (MedSummaryPage).toString());
    Get.put(MedSummaryController(), tag: (MedSummaryDetailPage).toString());
  }
}
