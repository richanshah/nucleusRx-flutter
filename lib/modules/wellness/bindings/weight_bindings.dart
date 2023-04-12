import 'package:flutter_demo_richa/modules/wellness/controller/height_controller.dart';
import 'package:flutter_demo_richa/modules/wellness/ui/vitals_height_page.dart';

import '../../../utils/exports.dart';

class WeightBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WeightController(), tag: (WeightPage).toString());
  }
}