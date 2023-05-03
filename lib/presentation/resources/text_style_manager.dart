import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return /* GoogleFonts.petrona(
      textStyle:  */
      TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    // )
  );
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s18d, Color color = ColorManager.black}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s18d, Color color = ColorManager.black}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s18d,
  Color color = ColorManager.black,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s18d, Color color = ColorManager.black}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s18d, Color color = ColorManager.black}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
