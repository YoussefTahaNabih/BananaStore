import 'package:flutter/material.dart';

import 'font_manger.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamliy,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyl(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color);
}

TextStyle getBoldStyl({double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.bold, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color);
}

TextStyle getLightStyl({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.light, color);
}
