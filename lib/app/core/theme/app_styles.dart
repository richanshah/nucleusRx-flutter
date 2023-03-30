import 'package:flutter_demo_richa/gen/fonts.gen.dart';

import '../../../utils/exports.dart';

abstract class AppStyles {
  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// displayLarge
  static TextStyle displayLarge = _lightStyle.copyWith(
    fontSize: Dimens.fontSize96,
    letterSpacing: -1.5,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline2    60.0  light   -0.5
  /// displayMedium
  static TextStyle displayMedium = _lightStyle.copyWith(
    fontSize: Dimens.fontSize60,
    letterSpacing: -0.5,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline3    48.0  regular  0.0
  /// displaySmall
  static TextStyle displaySmall = _regularStyle.copyWith(
    fontSize: Dimens.fontSize48,
    letterSpacing: 0,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline4    34.0  regular  0.25
  /// headlineMedium
  static TextStyle headlineMedium = _regularStyle.copyWith(
    fontSize: Dimens.fontSize34,
    letterSpacing: 0.25,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline5    24.0  regular  0.0
  /// headlineSmall
  static TextStyle headlineSmall = _regularStyle.copyWith(
    fontSize: Dimens.fontSize24,
    letterSpacing: 0,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline6    20.0  medium   0.15
  /// titleLarge
  static TextStyle titleLarge = _mediumStyle.copyWith(
    fontSize: Dimens.fontSize20,
    letterSpacing: 0.15,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// subtitle1    16.0  regular  0.15
  /// titleMedium
  static TextStyle titleMedium = _regularStyle.copyWith(
    fontSize: Dimens.fontSize16,
    letterSpacing: 0.15,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// subtitle2    14.0  medium   0.1
  /// titleSmall
  static TextStyle titleSmall = _mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
    letterSpacing: 0.1,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// body1        16.0  regular  0.5   (bodyText1)
  /// bodyLarge
  static TextStyle bodyLarge = _regularStyle.copyWith(
    fontSize: Dimens.fontSize16,
    letterSpacing: 0.5,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// body2        14.0  regular  0.25  (bodyText2)
  /// bodyMedium
  static TextStyle bodyMedium = _regularStyle.copyWith(
    fontSize: Dimens.fontSize14,
    letterSpacing: 0.25,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// body3        12.0  regular  0.4  (bodyText3/caption)
  /// bodySmall
  static TextStyle bodySmall = _regularStyle.copyWith(
    fontSize: Dimens.fontSize12,
    letterSpacing: 0.4,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// button       14.0  medium   1.25
  /// labelLarge
  static TextStyle labelLarge = _mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
    letterSpacing: 1.25,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// caption      12.0  regular  0.4
  /// labelMedium
  static TextStyle labelMedium = _regularStyle.copyWith(
    fontSize: Dimens.fontSize12,
    letterSpacing: .4,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// overLine     10.0  regular  1.5
  /// labelSmall
  static TextStyle labelSmall = _regularStyle.copyWith(
    fontSize: Dimens.fontSize10,
    letterSpacing: 1.5,
  );

  static final TextStyle _lightStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w300,
  );

  /// Officially the fontWeight for regularStyle is 400 but as per our XD
  /// we have to consider 500 for regularStyle
  static final TextStyle _regularStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  /// Officially the fontWeight for mediumStyle is 500 but as per our XD
  /// we have to consider 600 for mediumStyle
  static final TextStyle _mediumStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle _semiBoldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle _boldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _textStyle = TextStyle(
    fontFamily: FontFamily.roboto,
    color: AppColors.onPrimary,
  );

  static TextStyle get errorStyle => _regularStyle.copyWith(
        color: AppColors.error,
      );

  static TextStyle get hintStyle => _regularStyle.copyWith(
        color: AppColors.inActiveGrayColor,
      );

  static TextStyle get helperStyle => _semiBoldStyle.copyWith(
        color: AppColors.inActiveGrayColor,
      );

  static TextStyle get counterStyle => _regularStyle.copyWith(
        color: AppColors.onPrimary.shade100,
      );

  static TextStyle textBold = _boldStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static TextStyle textSemiBold = _semiBoldStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static TextStyle textNormal = _regularStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static TextStyle textMedium = _mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static TextStyle textLight = _lightStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static TextTheme get textTheme =>
        TextTheme(
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
        ).apply(
          bodyColor: AppColors.labelGrimGreyColor,
          displayColor: AppColors.labelGrimGreyColor,
        );
}
