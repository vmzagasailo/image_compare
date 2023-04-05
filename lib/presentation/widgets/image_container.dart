import 'dart:io';

import 'package:compare_image/presentation/resources/app_colors.dart';
import 'package:compare_image/presentation/resources/app_images.dart';
import 'package:flutter/material.dart';

/// Container for image
class ImageContainer extends StatelessWidget {
  /// image file
  final File? image;

  /// Pass image to constructor
  const ImageContainer({required this.image});

  @override
  Widget build(BuildContext context) {
    const double _containerHeight = 150;

    return Container(
      height: _containerHeight,
      decoration: BoxDecoration(
        border: image != null
            ? Border.all(
                color: AppColors.grey1,
              )
            : null,
      ),
      child: image == null
          ? Image.asset(AppImages.defaultImage)
          : Image.file(image!),
    );
  }
}
