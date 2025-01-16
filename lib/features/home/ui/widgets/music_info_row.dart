import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/core/helpers/assets.dart';
import 'package:spiders_task/core/theming/styles.dart';

class MusicInfoRow extends StatelessWidget {
  const MusicInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesMusic,
        ),
        const Gap(8),
        Text(
          "Page name · Original Audio",
          style: Styles.font12Regular,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        )
      ],
    );
  }
}
