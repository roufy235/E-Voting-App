import 'package:evoting/config/colors.dart';
import 'package:flutter/material.dart';

Color getBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return kColorWhite;
  }
  return kBlackDColor;
}

Color getFadedBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return kBlackFadedLightColor;
  }
  return kBlackDFadedLightColor;
}

Color getScaffoldColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return kColorWhite;
  }
  return kBlackDColor;
}

Color getTextColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return kBlackColor;
  }
  return kColorWhite;
}

