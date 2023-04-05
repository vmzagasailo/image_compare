import 'package:compare_image/domain/cubits/compare_image/compare_image_state.dart';
import 'package:compare_image/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';

/// Widget which showing result of comparison
class ComparisonResult extends StatelessWidget {
  ///Field for comparison data
  final CompareImageState stateData;

  ///pass state to constructor
  const ComparisonResult({required this.stateData});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 20;

    final firstImageWidth = stateData.imageResolution1?.width;
    final firstImageHeight = stateData.imageResolution1?.height;

    final secondImageWidth = stateData.imageResolution2?.width;
    final secondImageHeight = stateData.imageResolution2?.height;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.lightBlue[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            const Text('Comparison result', style: TextStyles.subheading18),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DataText(
                      text: '${stateData.firstImageSize?.size} Kb',
                    ),
                    _DataText(
                      text: '${firstImageWidth}X$firstImageHeight',
                    ),
                  ],
                ),
                Column(
                  children: const [
                    _SubtitleText(text: 'Size'),
                    _SubtitleText(text: 'Resolution'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _DataText(text: '${stateData.secondImageSize?.size} Kb'),
                    _DataText(text: '${secondImageWidth}X$secondImageHeight')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DataText extends StatelessWidget {
  final String text;
  const _DataText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyles.body14);
  }
}

class _SubtitleText extends StatelessWidget {
  final String text;
  const _SubtitleText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.body14.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
