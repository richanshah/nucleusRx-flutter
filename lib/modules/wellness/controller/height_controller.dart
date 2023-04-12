import 'package:flutter_demo_richa/modules/wellness/models/requests/quiz_paper_model.dart';

import '../../../utils/exports.dart';

class HeightController extends BaseGetxController {

  /// Text field Controller
  late   RxInt heightValue = 10.obs;
  late   RxInt heightFtValue = 10.obs;
  late   RxInt heightInValue = 10.obs;
  late   RxInt minValue = 0.obs;
  late   RxInt maxValue = 120.obs;

  late final DashboardController dashboardController;
  
  late  RxList<HeightModel> heightModel;
  final RxList<Widget> toggleItem = <Widget>[Text('Ft In'), Text('Cms'),].obs;
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
  void addToList(HeightModel item) {
    print('adding: $item');
    heightModel.add(item);
  }
  @override
  void onControllerInit() {
    super.onControllerInit();
    dashboardController =
        Get.find<DashboardController>(tag: (DashboardPage).toString());

    heightModel = <HeightModel>[
      HeightModel(title: '65', type: 'Ft In'),
      HeightModel(title: '40', type: 'Ft In'),
      HeightModel(title: '50', type: 'Ft In'),
      HeightModel(title: '30', type: 'Cms'),
      HeightModel(title: '40', type: 'Cms'),
      HeightModel(title: '60', type: 'Cms'),
    ].obs;


  }

  void onBackPressed() {
    Get.back();
    dashboardController.updateCurrentIndex();
  }
}
