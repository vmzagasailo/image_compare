import 'package:compare_image/domain/cubits/compare_image/compare_image_cubit.dart';
import 'package:compare_image/domain/cubits/compare_image/compare_image_state.dart';
import 'package:compare_image/presentation/resources/app_colors.dart';
import 'package:compare_image/presentation/resources/text_styles.dart';
import 'package:compare_image/presentation/screens/widgets/comparison_result.dart';
import 'package:compare_image/presentation/widgets/custom_app_bar.dart';
import 'package:compare_image/presentation/widgets/custom_button.dart';
import 'package:compare_image/presentation/widgets/image_container.dart';
import 'package:compare_image/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Implementation home screen
class HomeScreen extends StatefulWidget {
  ///
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        newTitle: const Text(
          'Compare image',
          style: TextStyles.subheading18,
        ),
      ),
      body: _BuildBody(),
    );
  }
}

class _BuildBody extends StatelessWidget {
  final _compareImageCubit = CompareImageCubit();

  _BuildBody();

  @override
  Widget build(BuildContext context) {
    const int firstImage = 1;
    const int secondImage = 2;
    const double widthSizedBox = 150;

    return BlocConsumer<CompareImageCubit, CompareImageState>(
      bloc: _compareImageCubit,
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: widthSizedBox,
                    child: Column(
                      children: [
                        ImageContainer(image: state.firstImage),
                        const SizedBox(height: 20),
                        CustomButton(
                          title: 'Add image 1',
                          hasIcon: true,
                          onPressed: () => _compareImageCubit.selectImage(
                            imageNumber: firstImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthSizedBox,
                    child: Column(
                      children: [
                        ImageContainer(image: state.secondImage),
                        const SizedBox(height: 20),
                        CustomButton(
                          title: 'Add image 2',
                          hasIcon: true,
                          onPressed: () => _compareImageCubit.selectImage(
                            imageNumber: secondImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: CustomButton(
                  title: 'Compare',
                  hasIcon: false,
                  onPressed: () => onCompareTap(context, state),
                ),
              ),
              if (state.isLoading) const CircularProgressIndicator(),
              //if (firstImageSize != null || secondImageSize != null)
              ComparisonResult(stateData: state),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state.errorMessage != null) {
          UiUtils.showWarningSnackBar(context, state.errorMessage);
        }
      },
    );
  }

  Future<void> onCompareTap(
    BuildContext context,
    CompareImageState state,
  ) async {
    if (state.firstImage == null || state.secondImage == null) {
      UiUtils.showWarningSnackBar(context, 'Please, add two images');
    } else {
      await _compareImageCubit.getCompareResult();
    }
  }
}
