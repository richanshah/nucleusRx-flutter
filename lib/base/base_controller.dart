import '../utils/exports.dart';

abstract class BaseGetxController extends FullLifeCycleController {
  /// here you can define common things that you want in all controller
  /// like apiManager
  ApiManager apiManager = Get.find<ApiManager>(tag: (ApiManager).toString());

  MainController mainController = Get.find<MainController>(tag: (MainController).toString());

  bool shouldObserveLifeCycle = true;

  void onControllerInit() {}

  void onControllerReady() {}

  void onControllerClose() {}

  void onPageResumed() {}

  void onPagePaused() {}

  void onPageInactive() {}

  void onPageDetached() {}

  /// Note : to be removed
  // ToolBarModel? setUpToolbar();

  /// Note : to be removed
  /*void updateToolBar({ToolBarModel? toolBarModel}) {
    ToolBarModel model;
    if (toolBarModel != null) {
      model = toolBarModel;
    } else if (setUpToolbar() != null) {
      model = setUpToolbar()!;
    } else {
      model = ToolBarModel();
    }
    mainController.toolBarModel.value = model;
  }*/

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    onControllerInit();
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
    onControllerClose();
  }

  @override
  void onReady() {
    super.onReady();
    onControllerReady();
  }

  void showLoader({required bool value}) {
    /// we have to add here code to show and hide loader
    hideKeyboard();
    if (value) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss(animation: true);
    }
  }

  void changeLocale(Locale locale) {
    // Add one more condition to check that the provided locale is valid for our app or not
    if(locale.toLanguageTag() != SharedPref.getString(PrefsKey.currentLocale)){
      SharedPref.setValue(PrefsKey.currentLocale, locale.toLanguageTag());
      Get.updateLocale(locale);
    }
  }

  void showSnackBar({required String value}) {
    hideKeyboard();
    Get.snackbar("", value,
        messageText: Text(value,
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppStyles.textMedium.copyWith(fontSize: 16, color: AppColors.materialWhite)),
        backgroundColor: AppColors.materialBlack,
        // maxWidth: screen.width < 500 ? screen.width : 500,
        margin: const EdgeInsets.all(0),
        isDismissible: true,
        padding: const EdgeInsets.only(left: Dimens.padding10, right: Dimens.padding10, top: Dimens.padding12, bottom: Dimens.padding15),
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const SizedBox());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(shouldObserveLifeCycle){
      switch (state) {
        case AppLifecycleState.paused:
          {
            hideKeyboard();
            onPagePaused();
            break;
          }
        case AppLifecycleState.inactive:
          {
            onPageInactive();
            break;
          }
        case AppLifecycleState.resumed:
          {
            hideKeyboard();
            /// Note : to be removed
            // updateToolBar();
            onPageResumed();
            break;
          }
        case AppLifecycleState.detached:
          {
            onPageDetached();
            break;
          }
      }  
    }
  }

  /// Note : need to be checked after updating all of the base
  bool checkAndCloseDrawer() {
    if(Scaffold.of(Get.context!).hasDrawer){
      var canPop = Scaffold.of(Get.context!).isDrawerOpen;
      Scaffold.of(Get.context!).closeDrawer();
      return canPop;
    }
    return false;
  }

  /// Note : need to be checked after updating all of the base
  // Future<bool> checkAndCloseDrawer() async {
  //   var isOpen = Scaffold.of(Get.context!).isDrawerOpen;
  //   if(isOpen) {
  //     Scaffold.of(Get.context!).closeDrawer();
  //   }
  //   return Future.value(isOpen);
  // }

  void hideKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
