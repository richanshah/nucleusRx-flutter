import 'package:flutter_demo_richa/modules/wellness/models/requests/quiz_paper_model.dart';

import '../../../utils/exports.dart';

class WeightController extends BaseGetxController {

  /// Text field Controller
  final weightValueController = TextEditingController();

  late final DashboardController dashboardController;
  late  RxList<WeightModel> weightModel;
  late final RxList<QuizPaperModel> questionItem;
  final RxList<Widget> toggleItem = <Widget>[Text('Kg'), Text('Lbs'),].obs;
  final RxList<bool> selectedToggle = <bool>[true, false ].obs;
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


  }

  void onBackPressed() {
    Get.back();
    dashboardController.updateCurrentIndex();
  }
}
