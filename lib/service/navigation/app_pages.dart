import '../../utils/exports.dart';

class AppPages {
  AppPages._();
  static const initial = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const otp = '/otp';
  static const newUser = '/newUser';
  static const user = '/user';
  static const wellness = '/wellness';
  static const home = '/home';
  static const medSummary = '/medSummary';
  static const profile = '/profile';
  static const doseTimePreference = '/doseTimePreference';
  static const changePasscode = '/changePasscode';
  static const demo = '/demo';

  static final routes = [
    ...SplashRoutes.routes,
    ...LoginRoutes.routes,
    ...OtpRoutes.routes,
    ...DashboardRoutes.routes,
    ...HomeRoutes.routes,
    ...MedSummaryRoutes.routes,
    ...MedSummaryDetailsRoutes.routes,
    ...WellnessRoutes.routes,
    ...HeightRoutes.routes,
    ...WeightRoutes.routes,
    ...MessagesRoutes.routes,
    ...SettingsRoutes.routes,
    ...ChildBusDetailsRoutes.routes,
  ];
}
