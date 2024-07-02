import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.primary,
    useMaterial3: true,
    fontFamily: 'DINNEXTLTARABIC',
    // app bar theme
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: ColorManager.white,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.backgroundText,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.sizeOf(context).height*.025,
          fontFamily: 'DINNEXTLTARABIC',
        ),
        iconTheme: const IconThemeData(
          color: ColorManager.primary,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
        )),
  );
}