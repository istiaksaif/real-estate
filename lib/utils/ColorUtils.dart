import 'package:flutter/material.dart';
import '/utils/app_style.dart';

class ColorUtils {
  static bool getMode(BuildContext context) {
    return false;
  }

  static Color getBackGround(BuildContext context) {
    return ColorStyles.backGroundColor;
  }

  static Color getPrimaryText(BuildContext context) {
    return ColorStyles.textColorDark;
  }

  static Color getSecondText(BuildContext context) {
    return ColorStyles.textColorExtraLight;
  }

  // static Color getTrackColor(BuildContext context) {
  //   return Provider.of<ThemeProvider>(context, listen: false).currentTheme ==
  //           true
  //       ? ColorStyles.track_tint_dark
  //       : ColorStyles.track_tint;
  // }
  //
  // static Color getThumbColor(BuildContext context) {
  //   return Provider.of<ThemeProvider>(context, listen: false).currentTheme ==
  //           true
  //       ? ColorStyles.thumb_tint_dark
  //       : ColorStyles.thumb_tint;
  // }
  //
  // static Color getTrackColorActive(BuildContext context) {
  //   return Provider.of<ThemeProvider>(context, listen: false).currentTheme ==
  //           true
  //       ? ColorStyles.track_tint_actvie_dark
  //       : ColorStyles.track_tint_actvie;
  // }
  //
  // static Color getThumbColorActive(BuildContext context) {
  //   return Provider.of<ThemeProvider>(context, listen: false).currentTheme ==
  //           true
  //       ? ColorStyles.thumb_tint_actvie_dark
  //       : ColorStyles.thumb_tint_actvie;
  // }

  static Color getLineColor(BuildContext context) {
    return ColorStyles.lineColor;
  }

  static Color getBottomLineColor(BuildContext context) {
    return ColorStyles.bottomLineColor;
  }

  static Color getSplashName(BuildContext context) {
    return ColorStyles.splashNameBlue;
  }

  static Color getShimmerBase(BuildContext context) {
    return ColorStyles.shimmerBaseLight;
  }

  static Color getShimmerHigh(BuildContext context) {
    return ColorStyles.shimmerHighLight;
  }
}
