import '../../../utils/exports.dart';

class ThemeWidget extends StatelessWidget {
  ThemeWidget({Key? key, required this.widget}) : super(key: key);
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Theme(data: getTheme(), child: widget!);
  }

  final ColorScheme appColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    secondaryContainer: AppColors.secondaryContainer,
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    background: AppColors.background,
    onBackground: AppColors.onBackground,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    outline: AppColors.outline,
    shadow: AppColors.shadow,
  );

  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: getAppBarTheme(),
      primaryTextTheme: AppStyles.textTheme,
      colorScheme: appColorScheme,
      splashColor: appColorScheme.onPrimary.withOpacity(0.14),
      indicatorColor: AppColors.activeBlueColor,
      iconTheme: IconThemeData(color: appColorScheme.onBackground),
      scaffoldBackgroundColor: appColorScheme.background,
      buttonTheme: getButtonTheme(),
      textButtonTheme: getTextButtonThemeData(),
      elevatedButtonTheme: getElevatedButtonThemeData(),
      outlinedButtonTheme: getOutlinedButtonThemeData(),
      floatingActionButtonTheme: getFloatingActionButtonThemeData(),
      textTheme: AppStyles.textTheme,
      inputDecorationTheme: getInputDecorationTheme(),
      textSelectionTheme: getTextSelectionThemeData(),
      cardTheme: getCardTheme(),
      dialogTheme: getDialogTheme(),
      bottomSheetTheme: getBottomSheetThemeData(),
      bottomNavigationBarTheme: getBottomNavigationBarThemeData(),
      dividerColor: appColorScheme.outline,
      drawerTheme: getDrawerThemeData(),
      // toggleButtonsTheme
      // :,
      // timePickerTheme
      // :,
      tabBarTheme: getTabBarTheme(),
      switchTheme: getSwitchThemeData(),
      snackBarTheme: getSnackBarThemeData(),
      // sliderTheme
      // :,
      radioTheme: getRadioThemeData(),
      // checkboxTheme
      // :,
      progressIndicatorTheme: getProgressIndicatorThemeData(),
      popupMenuTheme: getPopupMenuThemeData(),
      useMaterial3: false,
    );
  }

  AppBarTheme getAppBarTheme() {
    return AppBarTheme(
      color: appColorScheme.primary,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
          color: appColorScheme.onPrimary, size: Dimens.iconSizeRegular),
      shadowColor: AppColors.appBarShadow,
      elevation: 0,
      toolbarHeight: Dimens.appBarHeight.h,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.appBarShadow,
        ),
      ),
      iconTheme: IconThemeData(
        color: appColorScheme.onPrimary,
      ),
      titleTextStyle: AppStyles.titleLarge.copyWith(
        fontSize: Dimens.fontSize20.sp,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: appColorScheme.background,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  ButtonThemeData getButtonTheme() {
    return ButtonThemeData(
      buttonColor: appColorScheme.secondary,
      disabledColor: appColorScheme.outline,
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.padding10, horizontal: Dimens.padding20),
      colorScheme: appColorScheme,
      textTheme: ButtonTextTheme.primary,
      splashColor: appColorScheme.onPrimary.withOpacity(0.14),
      shape: RoundedRectangleBorder(
          borderRadius: Dimens.radiusXXXXXSmall.r.borderRadius,
          side: BorderSide(
              color: appColorScheme.secondary,
              style: BorderStyle.solid,
              width: Dimens.borderWidthSmall)),
    );
  }

  TextButtonThemeData getTextButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return appColorScheme.primary.withOpacity(0.14);
            }

            return null;
          },
        ),
        // If you want to set textStyle for button with color, first you have
        // remove foreground color, so giving null as value.
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.inActiveGrayColor;
          }
          return AppColors.activeBlueColor;
        }),
        // Setting textStyle for text of button
        textStyle: MaterialStatePropertyAll(
          AppStyles.titleLarge.copyWith(
              fontSize: Dimens.fontSize20.sp, color: AppColors.activeBlueColor),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: Dimens.radiusXXXXXSmall.r.borderRadius,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return appColorScheme.outline;
            }
            return null;
          },
        ),
      ),
    );
  }

  ElevatedButtonThemeData getElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return appColorScheme.onPrimary.withOpacity(0.14);
            }
            return null;
          },
        ),
        shadowColor: MaterialStatePropertyAll(
          appColorScheme.shadow,
        ),
        elevation: MaterialStatePropertyAll(
          Dimens.spaceSmall.h,
        ),
        backgroundColor: MaterialStatePropertyAll(
          appColorScheme.secondary,
        ),
        // If you want to set textStyle for button with color, first you have
        // remove foreground color, so giving null as value.
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.buttonInActiveColor;
          }
          return AppColors.activeBlueColor;
        }),
        // Setting textStyle for text of button
        textStyle: MaterialStatePropertyAll(
          AppStyles.titleLarge.copyWith(
              fontSize: Dimens.fontSize20.sp, color: AppColors.activeBlueColor),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: Dimens.padding10.h,
            horizontal: Dimens.padding13.w,
          ),
        ),
        // padding: MaterialStatePropertyAll(
        //   EdgeInsets.symmetric(
        //       horizontal: Dimens.padding30.w, vertical: Dimens.padding12.h),
        // ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: AppColors.buttonBorderColor,
            style: BorderStyle.solid,
            strokeAlign: 1,
            width: Dimens.borderWidthSmall,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: Dimens.radiusXXXXXSmall.r.borderRadius,
          ),
        ),
      ),
    );
  }

  OutlinedButtonThemeData getOutlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return appColorScheme.primary.withOpacity(0.14);
            }
            return null;
          },
        ),
        backgroundColor: MaterialStatePropertyAll(
          appColorScheme.background,
        ),
        // If you want to set textStyle for button with color, first you have
        // remove foreground color, so giving null as value.
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.inActiveGrayColor;
          }
          return AppColors.activeBlueColor;
        }),
        // Setting textStyle for text of button
        textStyle: MaterialStatePropertyAll(
          AppStyles.titleLarge.copyWith(
              fontSize: Dimens.fontSize20.sp, color: AppColors.activeBlueColor),
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
            horizontal: Dimens.padding30, vertical: Dimens.padding10)),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: AppColors.activeBlueColor,
            style: BorderStyle.solid,
            strokeAlign: 1,
            width: Dimens.borderWidthSmall,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: Dimens.radiusXXXXXSmall.r.borderRadius,
          ),
        ),
      ),
    );
  }

  FloatingActionButtonThemeData getFloatingActionButtonThemeData() {
    return FloatingActionButtonThemeData(
      elevation: Dimens.spaceXSmall,
      backgroundColor: appColorScheme.secondary,
      shape: RoundedRectangleBorder(
          borderRadius: Dimens.radiusXLarge.r.borderRadius),
      disabledElevation: Dimens.zero,
      extendedIconLabelSpacing: Dimens.spaceXLarge,
      splashColor: appColorScheme.primary.withOpacity(0.14),
    );
  }

  InputDecorationTheme getInputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimens.padding12.w,
        vertical: Dimens.padding6.h,
      ),
      prefixStyle:
          AppStyles.textNormal.copyWith(fontSize: Dimens.fontSize16.sp),
      hintStyle: AppStyles.hintStyle.copyWith(fontSize: Dimens.fontSize16.sp),
      labelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return AppStyles.errorStyle.copyWith(fontSize: Dimens.fontSize16.sp, height: Dimens.textHeightLarge);
        }
        return AppStyles.hintStyle.copyWith(fontSize: Dimens.fontSize16.sp, height: Dimens.textHeightLarge);
      }),
      focusColor: AppColors.activeBlueColor,
      hoverColor: Colors.transparent,
      errorStyle: AppStyles.errorStyle.copyWith(height: 0.7),
      errorMaxLines: 2,
      alignLabelWithHint: false,
      isDense: true,
      // enabledBorder: 10.outlineInputBorder(
      //   borderSide: 1.borderSide(color: appColorScheme.outline),
      // ),
      focusedBorder: Dimens.radiusXSmall.r.outlineInputBorder(
        borderSide: Dimens.borderWidthSmall.h
            .borderSide(color: AppColors.activeBlueColor),
      ),
      border: Dimens.radiusXSmall.r.outlineInputBorder(
        borderSide:
            Dimens.borderWidthSmall.h.borderSide(color: appColorScheme.outline),
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return AppStyles.errorStyle.copyWith(fontSize: Dimens.fontSize16.sp, height: Dimens.textHeightLarge);
        }
        if (states.contains(MaterialState.focused)) {
          return AppStyles.hintStyle.copyWith(fontSize: Dimens.fontSize16.sp, color: AppColors.activeBlueColor, height: Dimens.textHeightLarge);
        }
        return AppStyles.hintStyle.copyWith(fontSize: Dimens.fontSize16.sp, height: Dimens.textHeightLarge);
      }),
      errorBorder: Dimens.radiusXSmall.r.outlineInputBorder(
        borderSide:
            Dimens.borderWidthSmall.h.borderSide(color: appColorScheme.error),
      ),
      focusedErrorBorder: Dimens.radiusXSmall.r.outlineInputBorder(
        borderSide:
            Dimens.borderWidthSmall.h.borderSide(color: appColorScheme.error),
      ),
      disabledBorder: Dimens.radiusXSmall.r.outlineInputBorder(
        borderSide: Dimens.borderWidthSmall.h
            .borderSide(color: appColorScheme.outline.withOpacity(0.5)),
      ),
    );
  }

  TextSelectionThemeData getTextSelectionThemeData() {
    return TextSelectionThemeData(
      cursorColor: AppColors.activeBlueColor,
      selectionHandleColor: AppColors.activeBlueColor,
    );
  }

  CardTheme getCardTheme() {
    return CardTheme(
      color: appColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: Dimens.radiusXXLarge.r.borderRadius,
      ),
      shadowColor: appColorScheme.shadow,
      elevation: Dimens.spaceNormal.h,
    );
  }

  DialogTheme getDialogTheme() {
    return DialogTheme(
      backgroundColor: appColorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: Dimens.radiusXLarge.r.borderRadius,
      ),
      elevation: Dimens.spaceXSmall,
      titleTextStyle:
          AppStyles.titleLarge.copyWith(color: appColorScheme.onBackground),
      contentTextStyle: AppStyles.bodyMedium.copyWith(
        color: appColorScheme.onBackground,
      ),
    );
  }

  BottomSheetThemeData getBottomSheetThemeData() {
    return BottomSheetThemeData(
      backgroundColor: appColorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.radiusXXLarge.r),
          topRight: Radius.circular(Dimens.radiusXXLarge.r),
        ),
      ),
      modalBackgroundColor: appColorScheme.background,
      elevation: Dimens.spaceXSmall,
      modalElevation: Dimens.spaceXSmall,
    );
  }

  BottomNavigationBarThemeData getBottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: Dimens.spaceXSmall,
      backgroundColor: appColorScheme.background,
      selectedIconTheme: IconThemeData(
          color: AppColors.activeBlueColor, size: Dimens.iconSizeRegular.w),
      selectedItemColor: AppColors.activeBlueColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(
          color: AppColors.inActiveGrayColor, size: Dimens.iconSizeRegular.w),
      unselectedItemColor: AppColors.inActiveGrayColor,
      selectedLabelStyle: AppStyles.textNormal
          .copyWith(fontSize: Dimens.fontSize12.sp, height: Dimens.textHeightXXLarge.h),
      unselectedLabelStyle: AppStyles.textNormal
          .copyWith(fontSize: Dimens.fontSize12.sp, height: Dimens.textHeightXXLarge.h),
    );
  }

  DrawerThemeData getDrawerThemeData() {
    return DrawerThemeData(
      backgroundColor: appColorScheme.background,
    );
  }

  TabBarTheme getTabBarTheme() {
    return TabBarTheme(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.activeBlueColor.withOpacity(0.14);
          }
          return null;
        },
      ),
      // indicator: BoxDecoration(
      //     color: appColorScheme.primary,
      //     shape: BoxShape.rectangle,
      //     borderRadius: 2.borderRadius,
      //     gradient: LinearGradient(colors: [appColorScheme.primary])),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.symmetric(horizontal: Dimens.padding10.w),
      labelColor: AppColors.activeBlueColor,
      unselectedLabelColor: AppColors.inActiveGrayColor,
      labelStyle: AppStyles.textMedium.copyWith(
        fontSize: Dimens.fontSize20.sp,
      ),
      unselectedLabelStyle: AppStyles.textMedium.copyWith(
        fontSize: Dimens.fontSize20.sp,
      ),
      dividerColor: AppColors.appBarShadow,
    );
  }

  SwitchThemeData getSwitchThemeData() {
    return SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(appColorScheme.background),
      trackColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected) ||
              states.contains(MaterialState.pressed)) {
            return AppColors.activeBlueColor;
          }
          return AppColors.inActiveGrayColor;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.activeBlueColor.withOpacity(0.14);
          }
          return null;
        },
      ),
      splashRadius: Dimens.radiusXSmall.r,
    );
  }

  SnackBarThemeData getSnackBarThemeData() {
    return SnackBarThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: Dimens.radiusXXXSmall.r.borderRadius),
      backgroundColor: appColorScheme.onBackground,
      actionTextColor: appColorScheme.background,
      contentTextStyle:
          AppStyles.bodyMedium.copyWith(color: appColorScheme.background),
    );
  }

  RadioThemeData getRadioThemeData() {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.activeBlueColor;
        }
        return AppColors.radioUncheckedColor;
      }),
      splashRadius: Dimens.radiusXSmall.r,
    );
  }

  ProgressIndicatorThemeData getProgressIndicatorThemeData() {
    return ProgressIndicatorThemeData(
      circularTrackColor: Colors.transparent,
      color: AppColors.activeBlueColor,
      linearMinHeight: Dimens.spaceXXSmall,
      linearTrackColor: Colors.transparent,
    );
  }

  PopupMenuThemeData getPopupMenuThemeData() {
    return PopupMenuThemeData(
      color: appColorScheme.surface,
      elevation: Dimens.spaceXSmall,
      shape: RoundedRectangleBorder(
          borderRadius: Dimens.radiusXSmall.r.borderRadius),
      textStyle: AppStyles.bodySmall,
    );
  }
}
