import '../../../utils/exports.dart';

/// define all the Strings here which we have to localize

class AppString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        englishKey: {
          appName: 'SSCParent',
          login: 'Login',
          doNotHaveAccount: 'Don\'t have an account?',
          register: 'Register',
          emailId: 'Email Id',
          password: 'Password',
          show: 'Show',
          hide: 'Hide',
          forgotPassword: 'Forgot Password?',
          alreadyHaveAnAccount: 'Already have an account?',
          fullName: 'Full Name',
          phoneNo: 'Phone No',
          confirmPassword: 'Confirm Password',

          home: 'Home',
          medSummary: 'Medication summary',
          wellness: 'Wellness',
          messages: 'Messages',
          settings: 'Settings',

          yourChild: 'Your Child',
          busRoute: 'Bus Route',
          addChild: 'Add Child',
          addBusRoute: 'Add Bus Route',
          areYouSureDeleteChild: 'Are you sure you want to delete child?',
          areYouSureLogoutRoute: 'Are you sure you want to logout?',
          yesInUpperCase: 'YES',
          noInUpperCase: 'NO',
          resendVerificationLinkTitle: 'A verification link has been sent to your email account.',
          resendVerificationLinkDesc: 'Please click on the link that has been sent to your email account to verify your email and continue the registration process',
          resendLinkInUpperCase: 'RESEND LINK',
          childView: 'Child View',
          busView: 'Bus View',
          geofencing: 'Geofencing',
          callSchool: 'Call School',
          liveMap: 'Live Map',
          history: 'History',
          sun: 'Sun',
          mon: 'Mon',
          tues: 'Tues',
          wed: 'Wed',
          thurs: 'Thurs',
          fri: 'Fri',
          sat: 'Sat',

          // All the validations messages will be here

          passwordEmptyValidation: 'Please enter password',
          passwordMinValidation: 'Password should be minimum of 8 characters',
          passwordMaxValidation: 'Password should be maximum of 20 characters',

          emailEmptyValidation: 'Please enter email',
          emailPatternValidation: 'Please enter valid email',

          fullNameEmptyValidation: "Please enter full name",

          phoneEmptyValidation: 'Please enter phone number',
          phoneMinValidation: 'Phone number should be minimum of 10 characters',
          phoneMaxValidation: 'Phone number should be maximum of 14 characters',

          confirmPasswordEmptyValidation: 'Please enter confirm password',
          confirmPasswordMatchValidation:
              'Your password and confirmation password do not match'
        },
        spainKey: {
          appName: 'SSCParent',
          login: 'Acceso',
          home: 'Hogar',
        }
      };

  /// define all the keys here and use it in above may as key and give value of that key

  static const String englishKey = 'en_US';
  static const String spainKey = 'es_ES';

  static const String appName = "keyAppName";
  static const String login = "keyLogin";
  static const String doNotHaveAccount = "keyDontHaveAccount";
  static const String register = "keyRegister";
  static const String emailId = "keyEmailId";
  static const String password = "keyPassword";
  static const String show = "keyShow";
  static const String hide = "keyHide";
  static const String forgotPassword = "keyForgotPassword";

  static const String fullName = "keyFullName";
  static const String phoneNo = "keyPhoneNo";
  static const String confirmPassword = "keyConfirmPassword";
  static const String alreadyHaveAnAccount = "keyAlreadyRegistered";

  static const String home = "keyHome";
  static const String medSummary = "keyMedSummary";
  static const String wellness = "keyWellness";
  static const String messages = "keyMessages";
  static const String settings = "keySettings";

  static const String yourChild = "keyChild";
  static const String busRoute = "keyBusRoute";

  static const String addChild = "keyAddChild";
  static const String addBusRoute = "keyAddBusRoute";
  static const String areYouSureLogoutRoute = "keyAreYouSureDeleteBusRoute";
  static const String areYouSureDeleteChild = "keyAreYouSureDeleteChild";
  static const String yesInUpperCase = "keyYesInUpperCase";
  static const String noInUpperCase = "keyNoInUpperCase";
  static const String childView = "keyChildView";
  static const String busView = "keyBusView";
  static const String geofencing = "keyGeofencing";
  static const String callSchool = "keyCallSchool";
  static const String liveMap = "keyLiveMap";
  static const String history = "keyHistory";
  static const String sun = "keySun";
  static const String mon = "keyMon";
  static const String tues = "keyTues";
  static const String wed = "keyWed";
  static const String thurs = "keyThurs";
  static const String fri = "keyFri";
  static const String sat = "keySat";

  static const String resendVerificationLinkTitle = "keyResendVerificationLinkTitle";
  static const String resendVerificationLinkDesc = "keyResendVerificationLinkDesc";
  static const String resendLinkInUpperCase = "keyResendLinkInUpperCase";

  /// define all the validation related messages keys

  /// Password validation messages keys.
  static const String passwordEmptyValidation = "keyPasswordEmptyValidation";
  static const String passwordMinValidation = "keyPasswordMinValidation";
  static const String passwordMaxValidation = "keyPasswordMaxValidation";

  /// Email validation messages keys.
  static const String emailEmptyValidation = "keyEmailEmptyValidation";
  static const String emailPatternValidation = "keyEmailPatternValidation";

  /// Full Name validation messages keys.
  static const String fullNameEmptyValidation = "keyFullNameEmptyValidation";

  /// Phone Number validation messages keys.
  static const String phoneEmptyValidation = "keyPhoneEmptyValidation";
  static const String phoneMinValidation = "keyPhoneMinValidation";
  static const String phoneMaxValidation = "keyPhoneMaxValidation";

  /// Confirm Password validation messages keys.
  static const String confirmPasswordEmptyValidation =
      "keyConfirmPasswordEmptyValidation";
  static const String confirmPasswordMatchValidation =
      "keyConfirmPasswordMatchValidation";
}
