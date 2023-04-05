import 'dart:io';

import 'package:compare_image/domain/models/image/image_resolution/image_resolution.dart';
import 'package:compare_image/domain/models/image/image_size/image_size.dart';
import 'package:compare_image/utils/app_logger.dart';
import 'package:compare_image/utils/math_utils.dart';
import 'package:flutter/widgets.dart';

///Service for image comparison
class CompareImageService {
  final _appLogger = AppLogger();

  /// Get image size
  Future<ImageSize?> getImageSize(String? imagePath) async {
    _appLogger.logDebug(message: 'CompareImageService.getImageSize');
    if (imagePath != null) {
      final fileBytes = await File(imagePath).readAsBytes();

      final size = MathUtils.roundDouble(fileBytes.lengthInBytes / 1000, 1);
      
      return ImageSize(
        size: size,
      );
    }

    return null;
  }

  /// Get resolution of image
  Future<ImageResolution?> getFileResolution({
    required String? imagePath,
  }) async {
    _appLogger.logDebug(message: 'CompareImageService.getFileResolution');
    if (imagePath != null) {
      final image = File(imagePath);
      final decodedImage = await decodeImageFromList(image.readAsBytesSync());

      return ImageResolution(
        decodedImage.width,
        decodedImage.height,
      );
    }

    return null;
  }
}
