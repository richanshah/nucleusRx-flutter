import '../../../utils/exports.dart';

class WellnessBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WellnessController(), tag: (WellnessPage).toString());
    Get.put(WeightController(), tag: (WeightPage).toString());
    Get.put(HeightController(), tag: (HeightPage).toString());

  }
}