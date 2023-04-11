import 'package:flutter_demo_richa/modules/wellness/models/requests/quiz_paper_model.dart';
import 'package:flutter_demo_richa/modules/wellness/models/requests/vitals_model.dart';
import 'package:flutter_demo_richa/modules/wellness/models/requests/weight_model.dart';

import '../../../utils/exports.dart';

class WellnessController extends BaseGetxController {

  /// Text field Controller
  final weightValueController = TextEditingController();

  late final DashboardController dashboardController;
  late final RxList<VitalsModel> vitalsItem;
  late  RxList<WeightModel> weightModel;
  late final RxList<QuizPaperModel> questionItem;
  final RxList<Widget> toggleItem = <Widget>[
    Text('Kg'),
    Text('Lbs'),
  ].obs;
  final RxList<bool> selectedToggle = <bool>[true, false ].obs;

  final RxList<String> questions = ['Question 1', 'Question 2', 'Question 3'].obs;
  final RxList<String> options = [
    'One',
    'Two',
    'Three' /*,
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    ' Ten'*/
  ].obs;

  RxMap<String, String> selectedAnswer = Map<String, String>().obs;
  RxBool isKgsSelected = true.obs;

  void changeTabIndex(int index) {
    RxInt tabIndex = 0.obs;
    tabIndex.value = index;
    for(int buttonIndex = 0; buttonIndex < selectedToggle.length; buttonIndex++){
      if(buttonIndex == index){
        selectedToggle[buttonIndex] = true;
        isKgsSelected=true.obs;
      } else {
        selectedToggle[buttonIndex] = false;
        isKgsSelected=false.obs;

      }
    }
  }
  void addToList(WeightModel item) {
    print('adding: $item');
    weightModel.add(item);
  }
  @override
  void onControllerInit() {
    super.onControllerInit();
    dashboardController =
        Get.find<DashboardController>(tag: (DashboardPage).toString());

    weightModel = <WeightModel>[
      WeightModel(id: 1, title: '65', type: 'Kg', date: 'Today, 02:00 PM'),
      WeightModel(id: 2, title: '40', type: 'Kg', date: 'Today, 03:00 PM'),
      WeightModel(id: 3, title: '50', type: 'Kg', date: 'Today, 04:00 PM'),
      WeightModel(id: 4, title: '30', type: 'Lbs', date: 'Today, 01:00 PM'),
      WeightModel(id: 5, title: '40', type: 'Lbs', date: 'Today, 02:00 PM'),
      WeightModel(id: 6, title: '60', type: 'Lbs', date: 'Today, 03:00 PM'),
    ].obs;
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
    /*  questionItem= <QuizPaperModel>[
      QuizPaperModel(
          id: 1,
          title: 'Blood Pressure',
          questions: 'Question 1',
      ),
      QuizPaperModel(
          id: 2,
          title: 'Pulse',
          subTitle: '80 bpm',
          icon: Icons.health_and_safety_outlined,
          date: 'Today, 4:00 PM'),

    ].obs;*/
  }

  void onBackPressed() {
    Get.back();
    dashboardController.updateCurrentIndex();
  }
}
