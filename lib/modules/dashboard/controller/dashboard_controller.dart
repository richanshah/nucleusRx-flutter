import 'package:flutter_demo_richa/service/navigation/routes/change_passcode_routes.dart';

import '../../../utils/exports.dart';

class DashboardController extends BaseGetxController {
  late final String desiredRoute;
  late final Map<String, String?>? parameters;

  @override
  void onControllerInit() {
    super.onControllerInit();
    desiredRoute = Get.currentRoute;
    parameters = Get.parameters;
  }

  /// [List] of [BottomNavigationBarItem] for [BottomNavigationBar].
  List<BottomNavigationBarItem> navigationItemList() => [
        BottomNavigationBarItem(
          icon: Assets.svgs.icHome.svg(
            height: 21.18.h,
          ),
          label: AppString.home.tr,
          activeIcon: Assets.svgs.icHome.svg(
            height: 21.18.h,
            colorFilter: ColorFilter.mode(
              AppColors.activeBlueColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Assets.svgs.icCalendar.svg(
            height: 21.75.h,
          ),
          label: AppString.medSummary.tr,
          activeIcon: Assets.svgs.icCalendar.svg(
            height: 21.75.h,
            colorFilter: ColorFilter.mode(
              AppColors.activeBlueColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Assets.svgs.icAlert.svg(
            height: 20.74.h,
          ),
          label: AppString.wellness.tr,
          activeIcon: Assets.svgs.icAlert.svg(
            height: 20.74.h,
            colorFilter: ColorFilter.mode(
              AppColors.activeBlueColor,
              BlendMode.srcATop,
            ),
          ),
        ),
     /*   BottomNavigationBarItem(
          icon: Assets.svgs.icMessages.svg(
            height: 20.7.h,
          ),
          label: AppString.messages.tr,
          activeIcon: Assets.svgs.icMessages.svg(
            height: 20.7.h,
            colorFilter: ColorFilter.mode(
              AppColors.activeBlueColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Assets.svgs.icSettings.svg(
            height: 23.h,
          ),
          label: AppString.settings.tr,
          activeIcon: Assets.svgs.icSettings.svg(
            height: 23.h,
            colorFilter: ColorFilter.mode(
              AppColors.activeBlueColor,
              BlendMode.srcATop,
            ),
          ),
        ),*/
      ];
  var currentIndex = 0.obs;

  /// This Function will be called on the tap of any bottom bar item.
  void onNavigationItemClick(int position) {
    String path = '/';
    switch (position) {
      case 0:
        {
          path = AppPaths.home;
          // Here we only pop to the home page
          // cause home page will always be first in our case
          // so we will not duplicate screens.
          Get.until((route) => route.settings.name == path, id: 1);
          currentIndex.value = 0;
          return;
        }
      case 1:
        {
          path = AppPaths.medSummary;
          break;
        }
      case 2:
        {
          path = AppPaths.wellness;
          break;
        }
      case 3:
        {
          path = AppPaths.messages;
          break;
        }
      case 4:
        {
          path = AppPaths.settings;
          break;
        }
      default:
        {
          path = '/';
          break;
        }
    }

    // Checking if we are already on the same page
    // if yes we will not do any navigation.
    if (Get.currentRoute == path) {
      return;
    }

    // Remove all the routes from the stack except the first route
    //
    // logic is we have to navigate users back to
    // the default one (in our case its Home) when they press back button.
    // first route will always be [AppPaths.home].
    Get.offNamedUntil(
      path,
      (route) => route.isFirst,
      id: 1,
    );
  }

  /// Updates current index on back press.
  ///
  /// Getting called when user press system
  /// back button or back button from appBar
  /// to update bottom navigation bar selected
  /// item based on the latest visible route.
  void updateCurrentIndex() {
    switch (Get.currentRoute) {
      case AppPaths.home:
        {
          currentIndex.value = 0;
          break;
        }
      case AppPaths.medSummary:
        {
          currentIndex.value = 1;
          break;
        }
      case AppPaths.wellness:
        {
          currentIndex.value = 2;
          break;
        }
      case AppPaths.messages:
        {
          currentIndex.value = 3;
          break;
        }
      case AppPaths.settings:
        {
          currentIndex.value = 4;
          break;
        }
      case AppPaths.childBusDetails:
        {
          currentIndex.value = 5;
          break;
        }
      case AppPaths.changePasscode:
        {
          currentIndex.value = 6;
          break;
        }
    }
  }

  /// Responsible to handle the system back press for [DashboardPage].
  ///
  /// We are using this to update [currentIndex] of bottom navigation bar
  /// and to handle navigation of the nested navigation [Navigator] used in
  /// [DashboardPage] for bottom navigation bar while user press
  /// the system's back button.
  Future<bool> onWillPop() async {
    if (Get.nestedKey(1)?.currentState?.canPop() == true) {
      await Get.nestedKey(1)?.currentState?.maybePop();
      updateCurrentIndex();
      return Future.value(false);
    }
    return Future.value(true);
  }

  /// Responsible to generate routes for [DashboardPage] Navigator.
  Route<dynamic>? onGenerateRoute(
      RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case AppPaths.home:
        {
          currentIndex.value = 0;
          return HomeRoutes.routes.first.createRoute(context);
        }
      case AppPaths.medSummary:
        {
          currentIndex.value = 1;
          return MedSummaryRoutes.routes.first.createRoute(context);
        }
      case AppPaths.wellness:
        {
          currentIndex.value = 2;
          return WellnessRoutes.routes.first.createRoute(context);
        }
      case AppPaths.messages:
        {
          currentIndex.value = 3;
          return MessagesRoutes.routes.first.createRoute(context);
        }
      case AppPaths.weight:
        {
          return WeightRoutes.routes.first.createRoute(context);
        }
      case AppPaths.height:
        {
          return HeightRoutes.routes.first.createRoute(context);
        }
     /* case AppPaths.medSummaryDetail:
        {
          currentIndex.value = 4;
          return MedSummaryDetailsRoutes.routes.first.createRoute(context);
        }*/
     /* case AppPaths.settings:
        {
          currentIndex.value = 4;
          return SettingsRoutes.routes.first.createRoute(context);
        }
      case AppPaths.childBusDetails:
        {
          currentIndex.value = 5;
          return ChildBusDetailsRoutes.routes.first.createRoute(context);
        }
      case AppPaths.changePasscode:
        {
          currentIndex.value = 6;
          return ChangePasscodeRoutes.routes.first.createRoute(context);
        }*/
    }
    return null;
  }
}
