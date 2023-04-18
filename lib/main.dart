import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'utils/exports.dart';

void main() => AppInitializer.init(() async {
      Get.put(MainController(),
          permanent: true, tag: (MainController).toString());
      setPathUrlStrategy();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      runApp(
          const MyApp() /*DevicePreview(
          enabled: kDebugMode && !kIsWeb, builder: (context) => const MyApp())*/
          );
    });

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}

class MyApp extends GetView<MainController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  MainController get controller => Get.find(tag: (MainController).toString());


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 755),
      // 375,812 Add here XD Design Size
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: RebuildFactors.all,
      builder: (context, child) {
        return GetMaterialApp(
          builder: (context, child) {
            SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
              ),
            );

            final easyLoader =
                SafeArea(child: FlutterEasyLoading(child: child));
            // To Test Ui in different screens
            final devicePreview = DevicePreview.appBuilder(context, easyLoader);
            // add this if you don't want your font size to
            // be changed with system settings of font size
            final mediaQuery = MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context),
              child: easyLoader,
            );
            ThemeWidget themeWidget = ThemeWidget(widget: easyLoader);
            return themeWidget;
          },
          debugShowCheckedModeBanner: false,
          translations: AppString(),
          scrollBehavior: AppScrollBehavior(),
          locale: getCurrentLocale(),
          fallbackLocale: AppConstant.englishLocale,
          initialBinding: ApplicationBindings(),
          initialRoute: AppPaths.initial,
          getPages: AppPages.routes,
          useInheritedMediaQuery: true,
          onGenerateTitle: (context) => AppString.appName.tr,

          // theme: MyAppTheme.theme,
        );
      },
    );
  }
}
