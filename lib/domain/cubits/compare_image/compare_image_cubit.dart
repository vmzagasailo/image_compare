import 'package:bloc/bloc.dart';
import 'package:compare_image/domain/cubits/compare_image/compare_image_state.dart';
import 'package:compare_image/domain/services/compare_image_service.dart';
import 'package:compare_image/utils/app_logger.dart';
import 'package:compare_image/utils/function_utils.dart';

/// Implements business logic for home screen
class CompareImageCubit extends Cubit<CompareImageState> {
  final _compareImageService = CompareImageService();
  final _appLogger = AppLogger();

  /// Initialize state
  CompareImageCubit() : super(CompareImageState());

  /// This method set images to state
  void selectImage({required int imageNumber}) {
    _appLogger.logDebug(message: 'CompareImageCubit.selectImage');
    try {
      FunctionUtils.pickImage().then((image) {
        imageNumber == 1
            ? emit(state.copyWith(firstImage: image))
            : emit(state.copyWith(secondImage: image));
      });
    } catch (error) {
      emit(state.copyWith(errorMessage: '$error'));
      _appLogger.logError(message: '$error');
    }
  }

  /// This method set image size and resolution to state
  Future<void> getCompareResult() async {
    _appLogger.logDebug(message: 'CompareImageCubit.getCompareResult');
    emit(state.copyWith(isLoading: true));
    try {
      final firstImageSize =
          await _compareImageService.getImageSize(state.firstImage?.path);
      final secondImageSize =
          await _compareImageService.getImageSize(state.secondImage?.path);
      final imageResolution1 = await _compareImageService.getFileResolution(
        imagePath: state.firstImage?.path,
      );
      final imageResolution2 = await _compareImageService.getFileResolution(
        imagePath: state.secondImage?.path,
      );
      emit(
        state.copyWith(
          firstImageSize: firstImageSize,
          secondImageSize: secondImageSize,
          imageResolution1: imageResolution1,
          imageResolution2: imageResolution2,
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(state.copyWith(errorMessage: '$error', isLoading: false));
      _appLogger.logError(message: '$error');
    }
  }
}
