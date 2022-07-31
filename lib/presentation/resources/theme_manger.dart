import 'package:app/presentation/resources/font_manger.dart';
import 'package:app/presentation/resources/styles_manger.dart';
import 'package:app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

import 'color_manger.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.gray,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyl(fontSize: FontSize.s16, color: ColorManager.white)),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyl(
                color: ColorManager.white, fontSize: FontSize.s17),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(
      displayLarge:
          getLightStyl(color: ColorManager.white, fontSize: FontSize.s22),
      headlineLarge:
          getLightStyl(color: ColorManager.darkGray, fontSize: FontSize.s16),
      titleMedium: getMediumStyle(
          color: ColorManager.darkPrimary, fontSize: FontSize.s16),
      titleSmall:
          getRegularStyl(color: ColorManager.white, fontSize: FontSize.s16),
      bodyLarge:
          getRegularStyl(color: ColorManager.grey1, fontSize: FontSize.s18),
      bodySmall: getRegularStyl(color: ColorManager.gray),
      bodyMedium:
          getRegularStyl(color: ColorManager.grey2, fontSize: FontSize.s12),
      labelSmall: getBoldStyl(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
      titleLarge: getBoldStyl(color: ColorManager.black, fontSize: 16),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyl(color: ColorManager.gray, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManager.gray, fontSize: FontSize.s14),
        errorStyle: getRegularStyl(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}
