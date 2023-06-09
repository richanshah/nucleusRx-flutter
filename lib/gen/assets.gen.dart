/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsBannersGen {
  const $AssetsBannersGen();

  /// File path: assets/banners/ads_banner.png
  AssetGenImage get adsBanner =>
      const AssetGenImage('assets/banners/ads_banner.png');

  /// File path: assets/banners/splash_ads_banner.png
  AssetGenImage get splashAdsBanner =>
      const AssetGenImage('assets/banners/splash_ads_banner.png');

  /// File path: assets/banners/splash_top_banner.png
  AssetGenImage get splashTopBanner =>
      const AssetGenImage('assets/banners/splash_top_banner.png');

  /// File path: assets/banners/ssc_top_banner.png
  AssetGenImage get sscTopBanner =>
      const AssetGenImage('assets/banners/ssc_top_banner.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [adsBanner, splashAdsBanner, splashTopBanner, sscTopBanner];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();
  /// File path: assets/images/img_banana.png
  AssetGenImage get imgKeyIcon =>
      const AssetGenImage('assets/images/ic_keyicon.png');
 /// File path: assets/images/device_details_bg.png
  AssetGenImage get deviceDetailsBg =>
      const AssetGenImage('assets/images/device_details_bg.png');

  /// File path: assets/images/ic_logo.png
  AssetGenImage get icLogo => const AssetGenImage('assets/images/ic_logo.png');

  /// File path: assets/images/details_profile_image.png
  AssetGenImage get detailsProfileImage =>
      const AssetGenImage('assets/images/details_profile_image.png');

  /// File path: assets/images/details_screen_bg.png
  AssetGenImage get detailsScreenBg =>
      const AssetGenImage('assets/images/details_screen_bg.png');

  /// File path: assets/images/profile_image.png
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/images/profile_image.png');

  /// File path: assets/images/ic_share.png
  AssetGenImage get icShare =>
      const AssetGenImage('assets/images/ic_share.png');

  /// File path: assets/images/ic_next.png
  AssetGenImage get icNext => const AssetGenImage('assets/images/ic_next.png');

  /// File path: assets/images/ic_splash.png
  AssetGenImage get icSplash =>
      const AssetGenImage('assets/images/ic_splash.png');

  /// File path: assets/images/ic_star.png
  AssetGenImage get icWellness => const AssetGenImage('assets/images/undraw_mobile_posts_re_bpuw 1.png');


  /// List of all assets
  List<AssetGenImage> get values =>
      [detailsProfileImage, detailsScreenBg, profileImage,icNext,icShare,icSplash,imgKeyIcon,icLogo,icWellness,deviceDetailsBg];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/ic_alert.svg
  SvgGenImage get icAlert => const SvgGenImage('assets/svgs/ic_alert.svg');

  /// File path: assets/svgs/ic_back.svg
  SvgGenImage get icBack => const SvgGenImage('assets/svgs/ic_back.svg');

  /// File path: assets/svgs/ic_calendar.svg
  SvgGenImage get icCalendar =>
      const SvgGenImage('assets/svgs/ic_calendar.svg');

  /// File path: assets/svgs/ic_call.svg
  SvgGenImage get icCall => const SvgGenImage('assets/svgs/ic_call.svg');

  /// File path: assets/svgs/ic_delete_red.svg
  SvgGenImage get icDeleteRed =>
      const SvgGenImage('assets/svgs/ic_delete_red.svg');

  /// File path: assets/svgs/ic_geofancing.svg
  SvgGenImage get icGeofancing =>
      const SvgGenImage('assets/svgs/ic_geofancing.svg');

  /// File path: assets/svgs/ic_history.svg
  SvgGenImage get icHistory => const SvgGenImage('assets/svgs/ic_history.svg');


  /// File path: assets/svgs/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/svgs/ic_home.svg');

  /// File path: assets/svgs/ic_map.svg
  SvgGenImage get icMap => const SvgGenImage('assets/svgs/ic_map.svg');

  /// File path: assets/svgs/ic_messages.svg
  SvgGenImage get icMessages =>
      const SvgGenImage('assets/svgs/ic_messages.svg');

  /// File path: assets/svgs/ic_settings.svg
  SvgGenImage get icSettings =>
      const SvgGenImage('assets/svgs/ic_settings.svg');

  /// File path: assets/svgs/ic_pdd.svg
  String get icPdd => 'assets/svgs/ic_pdd.svg';

  /// List of all assets
  List<SvgGenImage> get values => [
        icAlert,
        icBack,
        icCalendar,
        icCall,
        icDeleteRed,
        icGeofancing,
        icHistory,
        icHome,
        icMap,
        icMessages,
        icSettings,

      ];
}

class Assets {
  Assets._();

  static const $AssetsBannersGen banners = $AssetsBannersGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
