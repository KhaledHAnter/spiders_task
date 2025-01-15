
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/core/theming/styles.dart';

class ReelUserProfile extends StatelessWidget {
  final String name;

  const ReelUserProfile({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
        ),
        const Gap(12),
        Text(
          name,
          style: Styles.font12Bold,
        )
      ],
    );
  }
}
