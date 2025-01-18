import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/features/home/ui/widgets/action_buttons_column.dart';
import 'package:spiders_task/features/home/ui/widgets/music_info_row.dart';
import 'package:spiders_task/features/home/ui/widgets/reel_info_text.dart';

class ReelLoader extends StatelessWidget {
  const ReelLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
        SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ReelInfoText(),
                      ActionButtonsColumn(),
                    ],
                  ),
                ),
                Gap(8),
                MusicInfoRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
