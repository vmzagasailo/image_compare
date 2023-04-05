import 'package:compare_image/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

///Implementation ui utils
class UiUtils {
  /// Use this method for showing errors
  static void showWarningSnackBar(BuildContext context, String? errorMessage) {
    const duration = Duration(seconds: 2);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage ?? ''),
        backgroundColor: Colors.red,
        duration: duration,
        showCloseIcon: true,
        closeIconColor: AppColors.white,
      ),
    );
  }
}
