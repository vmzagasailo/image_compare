import 'package:compare_image/presentation/resources/app_colors.dart';
import 'package:compare_image/presentation/resources/app_icons.dart';
import 'package:compare_image/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Reusable button
class CustomButton extends StatelessWidget {
  /// Name of button
  final String title;
  /// If true button has icon
  final bool hasIcon;

  /// Event handler
  final VoidCallback onPressed;

  /// Pass title, hasIcons and callback function
  const CustomButton({
    required this.title,
    required this.onPressed,
    required this.hasIcon,
  });

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 40;
    const double iconSize = 20;

    return SizedBox(
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.black),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        child: Center(
          child: hasIcon
              ? Row(
                  children: [
                    Text(
                      title,
                      style: TextStyles.subheading16,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      AppIcons.imageIcon,
                      width: iconSize,
                    )
                  ],
                )
              : Text(
                  title,
                  style: TextStyles.subheading16,
                ),
        ),
      ),
    );
  }
}
