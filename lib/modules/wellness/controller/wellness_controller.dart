import 'package:flutter_demo_richa/modules/wellness/models/requests/quiz_paper_model.dart';

import '../../../utils/exports.dart';

class WellnessController extends BaseGetxController {
  late final DashboardController dashboardController;
  late final RxList<VitalsModel> vitalsItem;
  late final RxList<QuizPaperModel> questionItem;

  final RxList<String> questions =
      ['Question 1', 'Question 2', 'Question 3'].obs;
  final RxList<String> options = ['One', 'Two', 'Three'].obs;

  RxMap<String, String> selectedAnswer = Map<String, String>().obs;

  @override
  void onControllerInit() {
    super.onControllerInit();
    dashboardController =
        Get.find<DashboardController>(tag: (DashboardPage).toString());

    vitalsItem = <VitalsModel>[
      VitalsModel(
          id: 1,
          title: 'Blood Pressure',
          subTitle: '44 bpm',
          icon: Icons.water_drop_outlined,
          date: 'Today, 02:00 PM'),
      VitalsModel(
          id: 2,
          title: 'Pulse',
          subTitle: '80 bpm',
          icon: Icons.health_and_safety_outlined,
          date: 'Today, 4:00 PM'),
      VitalsModel(
          id: 3,
          title: 'Blood Glucose Level',
          subTitle: '80 bpm',
          icon: Icons.map,
          date: 'Today, 5:00 PM'),
      VitalsModel(
          id: 4,
          title: 'Height',
          subTitle: '4.4',
          icon: Icons.height,
          date: 'Today, 01:00 PM'),
      VitalsModel(
          id: 5,
          title: 'Weight',
          subTitle: '4.4',
          icon: Icons.monitor_weight,
          date: 'Today, 11:00 PM'),
    ].obs;
  }

  void onBackPressed() {
    Get.back();
    dashboardController.updateCurrentIndex();
  }
}
