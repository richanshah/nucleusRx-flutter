import '../../../utils/exports.dart';

abstract class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static const defaultLetterSpacing = 0.03;

  static final materialWhite = createMaterialColor(Colors.white);
  static final materialBlack = createMaterialColor(Colors.black);

  static final primary = createMaterialColor(Colors.white);
  static final onPrimary = createMaterialColor(Colors.white);

  static final primaryContainer = primary;
  static final onPrimaryContainer = onPrimary;

  static final secondary = primary;
  static final onSecondary = onPrimary;
  static final onSecondaryContainer = primary;
  static final secondaryContainer = onPrimary;

  static final error = createMaterialColor(const Color(0xFFEB1E00));
  static final onError = materialWhite;
  static final errorContainer = createMaterialColor(Colors.redAccent.shade100);
  static final onErrorContainer = createMaterialColor(Colors.red.shade900);

  static final background = primary;
  static final onBackground = onPrimary;
  static final surface = createMaterialColor(Colors.white);
  static final onSurface = createMaterialColor(Colors.black);

  static final outline = createMaterialColor(const Color(0xFFB5B5B5));
  static const Color outlineGreyColor = Color(0xFFD3D5D8);
  static const Color outlineBgColor = Color(0xffF6F6F6);

  static final appBarShadow = createMaterialColor(const Color(0xFF9E9E9E));
  static final shadow = createMaterialColor(const Color(0xFF000000)); //59000000
  static final lightShadow = createMaterialColor(const Color(0x29000000));
  static final bottomNavigationShadow = createMaterialColor(const Color(0xFFF7F7F7));

  static final bodyTextColor = createMaterialColor(const Color(0xFF404040));

  /// Used for focused state
  static final activeBlueColor = createMaterialColor(const Color(0xFF0F418C));
  /// Used for unfocused state
  static final inActiveGrayColor = createMaterialColor(const Color(0xFF808080));

  static final buttonInActiveColor = createMaterialColor(const Color(0xFFC2C2C2));

  static final buttonBorderColor = createMaterialColor(const Color(0xFFEEEEEE));

  static final radioUncheckedColor = createMaterialColor(const Color(0xFFB4B4B4));
  static final itemDifferenceColor = createMaterialColor(const Color(0xFFF5F5F5));

  static final calendarBackgroundColor = createMaterialColor(const Color(0xFFE1E1E1));
  static final calendarCellBorderColor = createMaterialColor(const Color(0xFF00C000));

  // static const Color primaryColor = Color(0xFF054ECB);
  static const Color primaryColor = Color(0xFF042B8E);
  static const Color primaryDarkColor = Color(0xFF042B8E);
  static const Color statusBarColor = Color(0xFF033593);
  static const Color appBarColor = Color(0xFF033593);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);

  static const Color whiteGrayColor = Color(0xFFF9F9FD);
  static const Color darkGrayColor = Color(0xFF666666);
  static const Color lightGrayColor = Color(0xFF777777);

  static const Color blue = Color(0xFF0676DD);
  static const Color red = Color(0xFFFF0000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color pageBg = Color(0xFFFAFBFD);
  static const Color yellowColor =  Color(0xFFFBEE93);


  /// Alerts colors (Used in Listing)
  // static final yellowColor = createMaterialColor(const Color(0xFFFFF53C));//#FFFF00
  static final blueColor = activeBlueColor;
  static final redColor = error;
  static final MaterialColor checkoutBackgroundColor = createMaterialColor(const Color(0x201D1D1C));
  static final MaterialColor backgroundColor = createMaterialColor(const Color(0xFFEDEDED));
  static final MaterialColor yellowButtonColor = createMaterialColor(const Color(0xFFFBEE93));
  static final MaterialColor tileBackgroundColor = createMaterialColor(const Color(0xFFF9F9F9));
  static final MaterialColor darkTileBackgroundColor = createMaterialColor(const Color(0xFF575757));
  static final MaterialColor labelGrimGreyColor = createMaterialColor(const Color(0xFF777777));
  static final MaterialColor normalTextColorBlack = createMaterialColor(const Color(0x29000000));
  static final MaterialColor normalTextColorWhite = createMaterialColor(const Color(0x29000000));
  static final MaterialColor labelTextColorBlack = createMaterialColor(const Color(0x29000000));
  static final MaterialColor profileTextColor = createMaterialColor(const Color(0x601D1D1C));
  static final MaterialColor lowOpacityTextColor = createMaterialColor(const Color(0x401D1D1C));


}
