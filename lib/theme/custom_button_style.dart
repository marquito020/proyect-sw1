import 'dart:ui';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
  static ButtonStyle get fillOnErrorContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientIndigoToPrimaryDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        gradient: LinearGradient(
          begin: Alignment(0.16, 0),
          end: Alignment(0.86, 0),
          colors: [
            appTheme.indigo300,
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientOrangeAToBlueGrayDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        gradient: LinearGradient(
          begin: Alignment(0.16, 0),
          end: Alignment(0.86, 0),
          colors: [
            appTheme.orangeA200,
            appTheme.blueGray100,
          ],
        ),
      );
  static BoxDecoration get gradientPinkToOrangeDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        gradient: LinearGradient(
          begin: Alignment(0.16, 0),
          end: Alignment(0.86, 0),
          colors: [
            appTheme.pink400,
            appTheme.orange400,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleToPinkDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        gradient: LinearGradient(
          begin: Alignment(0.16, 0),
          end: Alignment(0.86, 0),
          colors: [
            appTheme.purple600,
            appTheme.pink40001,
          ],
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
