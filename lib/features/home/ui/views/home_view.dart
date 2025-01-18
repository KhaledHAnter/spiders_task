import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/core/theming/styles.dart';
import 'package:spiders_task/features/home/logic/cubit/home_cubit.dart';
import 'package:spiders_task/features/home/ui/widgets/action_buttons_column.dart';
import 'package:spiders_task/features/home/ui/widgets/music_info_row.dart';
import 'package:spiders_task/features/home/ui/widgets/reel_info_text.dart';
import 'package:video_player/video_player.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is ReelsSuccess ||
            current is ReelsFailure ||
            current is ReelsLoading,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Center(
                child: LoadingAnimationWidget.waveDots(
                    color: Colors.white,
                    size: MediaQuery.sizeOf(context).width / 3),
              );
            },
            reelsLoading: (isApiLoading, isVideoLoading) {
              if (isApiLoading) {
                return Center(
                  child: LoadingAnimationWidget.waveDots(
                      color: Colors.white,
                      size: MediaQuery.sizeOf(context).width / 3),
                );
              }

              if (isVideoLoading) {
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
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

              return const SizedBox.shrink();
            },
            reelsSuccess: (reels, chewieControllers, timestamp) {
              return PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: cubit.pageController,
                scrollDirection: Axis.vertical,
                itemCount: chewieControllers.length,
                onPageChanged: (index) {
                  // Reset video when changing pages
                  cubit.resetVideo(index);
                  if (index == reels.length - 3) {
                    log("pagination");
                    cubit.loadMoreReels();
                  }
                },
                itemBuilder: (context, index) {
                  if (index == 0) cubit.startVideo(index);
                  if (index == chewieControllers.length - 1) {
                    cubit.loadMoreReels();
                  }
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.playVideo(index);
                        },
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: chewieControllers[index]
                                .videoPlayerController
                                .value
                                .aspectRatio,
                            child: Chewie(
                              controller: chewieControllers[index],
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
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
                },
              );
            },
            reelsFailure: (apiErrorModel) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(apiErrorModel.message ?? "Oops! Something went wrong"),
                    TextButton(
                      onPressed: () {
                        cubit.emitReelsStates();
                      },
                      child: const Text("Retry"),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
