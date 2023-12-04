import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: theme.colorScheme.errorContainer,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90019,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo400,
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple50,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );

  // Gradient decorations
  static BoxDecoration get gradientIndigoToPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.16, 0.23),
          end: Alignment(0.86, 0.79),
          colors: [
            appTheme.indigo300,
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientOnErrorToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onError,
            appTheme.gray10001,
          ],
        ),
      );
  static BoxDecoration get gradientOrangeAToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.16, 0.23),
          end: Alignment(0.86, 0.79),
          colors: [
            appTheme.orangeA200,
            appTheme.blueGray100,
          ],
        ),
      );
  static BoxDecoration get gradientPinkToOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.16, 0.23),
          end: Alignment(0.86, 0.79),
          colors: [
            appTheme.pink400,
            appTheme.orange400,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleToPink => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.16, 0.23),
          end: Alignment(0.86, 0.79),
          colors: [
            appTheme.purple600,
            appTheme.pink40001,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder11 => BorderRadius.circular(
        11.h,
      );
  static BorderRadius get circleBorder17 => BorderRadius.circular(
        17.h,
      );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );

  // Custom borders
  static BorderRadius get customBorderLR20 => BorderRadius.horizontal(
        right: Radius.circular(20.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder27 => BorderRadius.circular(
        27.h,
      );
  static BorderRadius get roundedBorder64 => BorderRadius.circular(
        64.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
