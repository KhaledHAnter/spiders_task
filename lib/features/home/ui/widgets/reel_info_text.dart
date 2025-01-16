import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/features/home/ui/widgets/reel_description_read_more.dart';
import 'package:spiders_task/features/home/ui/widgets/reel_user_profile.dart';

class ReelInfoText extends StatelessWidget {
  const ReelInfoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        ReelUserProfile(
          name: "Page name",
        ),
        Gap(12),
        ReelDescriptionReadMore(
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor numbas sator Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor numbas sator',
          trimLines: 2,
        ),
      ],
    ));
  }
}
