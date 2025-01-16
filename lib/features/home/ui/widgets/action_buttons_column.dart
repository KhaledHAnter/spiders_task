import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/core/helpers/assets.dart';
import 'package:spiders_task/core/theming/styles.dart';

class ActionButtonsColumn extends StatelessWidget {
  const ActionButtonsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.imagesIconCamera),
        ),
        const Spacer(),
        SizedBox(
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.imagesHeart,
                ),
              ),
              Text(
                "234",
                style: Styles.font12SemiBold,
              )
            ],
          ),
        ),
        const Gap(16),
        SizedBox(
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesComment),
              ),
              Text(
                "45",
                style: Styles.font12SemiBold,
              )
            ],
          ),
        ),
        const Gap(16),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.imagesMore),
        ),
      ],
    );
  }
}
