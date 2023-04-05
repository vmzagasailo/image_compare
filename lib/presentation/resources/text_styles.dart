import 'package:compare_image/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

/// All text styles which we use in the app
class TextStyles {
  /// Text style for app bar
  static const subheading18 = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    height: 24 / 18,
    fontFamily: 'Rubik',
  );

  ///For buttons
  static const subheading16 = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    fontFamily: 'Rubik',
  );

  /// Use this text styles for title of buttons
  static const body14 = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    height: 24 / 14,
    fontFamily: 'Rubik',
  );

}
