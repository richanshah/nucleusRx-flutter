import '../../../utils/exports.dart';

/// Constants are must be define here
/// Constants which don't need Localization
/// the Constants which depends on Localization should be defined in AppStrings Class
abstract class AppConstant {
  static const String baseUrl = "http://localhost:5050/";
  static const String version = "v1";
  static const String appTitle = "FlutterGetxDemo";
  static const int splashTime = 2;
  static const double maxWidth = 400;

  static const configEnvironment = String.fromEnvironment('ENV');
  static const configBaseApiUrl = String.fromEnvironment('BASE_API_URL');

  static const String serverNotRespond = "Server not Respond";
  static const String internetNotConnected = "Internet not connected";
  static const String poorInternetConnection = "Poor internet connection";
  static const String unauthorized = "Unauthorized";
  static const String somethingWentWrong = "Something Went Wrong";

  static const Locale englishLocale = Locale('en', 'US');
  static const Locale spainLocale = Locale('es', 'ES');
}
