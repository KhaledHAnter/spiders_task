import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:spiders_task/core/theming/styles.dart';

class ReelDescriptionReadMore extends StatelessWidget {
  final String description;
  final int trimLines;
  const ReelDescriptionReadMore({
    super.key,
    required this.description,
    required this.trimLines,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      style: Styles.font12Regular,
      trimMode: TrimMode.Line,
      trimLines: trimLines,
      trimCollapsedText: '... more',
      trimExpandedText: '... Show less',
      lessStyle: Styles.font12Bold.copyWith(
        fontSize: 16,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white,
        decorationThickness: 4,
      ),
      moreStyle: Styles.font12Bold.copyWith(
        fontSize: 16,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white,
        decorationThickness: 4,
      ),
    );
  }
}
