import 'package:flutter_demo_richa/modules/wellness/controller/height_controller.dart';
import 'package:flutter_demo_richa/modules/wellness/ui/vitals_height_page.dart';

import '../../../utils/exports.dart';

class HeightBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HeightController(), tag: (HeightPage).toString());
  }
}