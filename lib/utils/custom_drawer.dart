import 'exports.dart';

class CustomDrawer extends StatefulWidget {
  // CustomDrawer({Key? key,required this.scaffoldKey}) : super(key: key);
  CustomDrawer({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selectedDrawerIndex = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  toggleDrawer() async {
    if (widget.scaffoldKey.currentState?.isDrawerOpen == true) {
      widget.scaffoldKey.currentState?.closeDrawer();
    } else {
      widget.scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            child: Image.asset(Assets.images.icSplash.path),
            decoration: const BoxDecoration(
              color: AppColors.appBarColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            contentPadding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            dense: true,
            title: const Text('Profile',
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                )),
            onTap: () {
              toggleDrawer();
              Get.to(const UserDetailsPage());
            },
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.only(
                top: -20, bottom: -20, left: 10, right: 10),
            childrenPadding: const EdgeInsets.only(top: 0, bottom: 0),
            trailing: const Icon(
              Icons.keyboard_arrow_down,
              size: 18.0,
              color: AppColors.primaryColor,
            ),
            title: const Text("Settings",
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                )),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.timer_sharp),
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 10, right: 10),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                dense: true,
                title: const Text("Dose time preference",
                    style: TextStyle(
                      color: AppColors.darkGrayColor,
                    )),
                onTap: () async {
                  await toggleDrawer();

                  Get.to(
                    () => const DoseListPage(),
                    duration: const Duration(milliseconds: 400), //
                    transition: Transition.zoom,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.password_outlined),
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 10, right: 10),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                dense: true,
                title: const Text("Change passcode",
                    style: TextStyle(
                      color: AppColors.darkGrayColor,
                    )),
                onTap: () async {
                  await toggleDrawer();
                  Get.to(
                    () => const ChangePasscodePage(),
                    duration: const Duration(milliseconds: 400),
                    transition: Transition.zoom,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 10, right: 10),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                dense: true,
                title: const Text("Notification reminder",
                    style: TextStyle(
                      color: AppColors.darkGrayColor,
                    )),
                onTap: () {
                  toggleDrawer();
                  Get.to(
                    () => const SettingsPage(),
                    duration: const Duration(milliseconds: 400), //
                    transition: Transition.zoom,
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.support),
            contentPadding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            dense: true,
            title: const Text('Support',
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                )),
            onTap: () {
              toggleDrawer();
              // Get.to(const ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.details),
            contentPadding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            dense: true,
            title: const Text('Device details',
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                )),
            onTap: () {
              toggleDrawer();
              // Get.toNamed(AppPaths.deviceDetails);
              Get.to(
                () => const DeviceDetailsPage(),
                duration: const Duration(milliseconds: 400),
                transition: Transition.upToDown,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            contentPadding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            dense: true,
            title: const Text('Logout',
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                )),
            onTap: () {
              Get.dialog(
                CustomDialog(
                  name: '',
                  nickName: '?',
                  description: AppString.areYouSureLogoutRoute.tr,
                  onNoTap: () {
                    Get.back();
                  },
                  onYesTap: () {
                    SystemNavigator.pop();
                  },
                ),
                navigatorKey: Get.nestedKey(null),
                barrierDismissible: false,
              );
              /*             Get.defaultDialog(
                  buttonColor: AppColors.primaryColor,
                  title: "",
                  middleText: "Are you sure you want to logout?",
                  contentPadding: const EdgeInsets.all(20),
                  titlePadding: const EdgeInsets.only(top: 20),
                  textConfirm: "LOGOUT",
                  onConfirm: () {
                    SystemNavigator.pop();
                  },
                  textCancel: "CANCEL");*/
            },
          ),
        ],
      ),
    );
  }

  // set selected menu
  void _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }
}
