import 'dart:io';

import 'package:compare_image/domain/models/image/image_resolution/image_resolution.dart';
import 'package:compare_image/domain/models/image/image_size/image_size.dart';

/// State class for CompareImageCubit
class CompareImageState {
  /// field for loading
  final bool isLoading;

  /// field for first image
   File? firstImage;

  /// field for second image
  final File? secondImage;

  /// field for size of first image
  final ImageSize? firstImageSize;

  /// field for size of second image
  final ImageSize? secondImageSize;

  /// field for resolution of first image
  final ImageResolution? imageResolution1;
  
  /// field for resolution of second image
  final ImageResolution? imageResolution2;

  /// field for error
  final String? errorMessage;

  /// isLoading by default = false, all other fields can be nullable
   CompareImageState({
    this.isLoading = false,
    this.firstImage,
    this.secondImage,
    this.errorMessage,
    this.firstImageSize,
    this.secondImageSize,
    this.imageResolution1,
    this.imageResolution2,
  });

  /// Method for changing class properties
  CompareImageState copyWith({
    bool? isLoading,
    File? firstImage,
    File? secondImage,
    String? errorMessage,
    ImageSize? firstImageSize,
    ImageSize? secondImageSize,
    ImageResolution? imageResolution1,
    ImageResolution? imageResolution2,
  }) {
    return CompareImageState(
      isLoading: isLoading ?? this.isLoading,
      firstImage: firstImage ?? this.firstImage,
      secondImage: secondImage ?? this.secondImage,
      errorMessage: errorMessage ?? this.errorMessage,
      firstImageSize: firstImageSize ?? this.firstImageSize,
      secondImageSize: secondImageSize ?? this.secondImageSize,
      imageResolution1: imageResolution1 ?? this.imageResolution1,
      imageResolution2: imageResolution2 ?? this.imageResolution2,
    );
  }

}
