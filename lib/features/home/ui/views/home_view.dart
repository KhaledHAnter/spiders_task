import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spiders_task/features/home/logic/cubit/home_cubit.dart';
import 'package:spiders_task/features/home/ui/widgets/action_buttons_column.dart';
import 'package:spiders_task/features/home/ui/widgets/music_info_row.dart';
import 'package:spiders_task/features/home/ui/widgets/reel_info_text.dart';
import 'package:video_player/video_player.dart'; // استيراد مكتبة video_player

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late PageController _pageController;
  late List<VideoPlayerController> _controllers;
  late List<bool> _isPaused; // لتتبع حالة الـ Pause لكل فيديو

  final List<String> videoUrls = [
    'https://s3.sawalef.app/efb325f74bde4071a4f20e0afdc8d480:sawalef/sawalef/s3/roomvideos/z4VVvhQEvic5qEiYRpHaCDSF0os7FlcO3ztPzFvx.mp4',
    'https://s3.sawalef.app/efb325f74bde4071a4f20e0afdc8d480:sawalef/sawalef/s3/roomvideos/zJcNXmszYYTBob0kwvRMIDk4oKKKyS9k5MK83gSL.mp4',
    // أضف المزيد من الفيديوهات هنا
  ];

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
    _controllers = videoUrls
        .map((url) =>
            VideoPlayerController.networkUrl(Uri.parse(url))..initialize())
        .toList(); // استخدام networkUrl بدلاً من network
    _isPaused = List.generate(videoUrls.length, (index) => false);

    // تشغيل الفيديو تلقائيًا عند التهيئة
    for (var controller in _controllers) {
      controller.setLooping(true); // إعادة تشغيل الفيديو عند الانتهاء
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose(); // تحرير الذاكرة لكل Controller
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: cubit.pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // استبدال الـ Container بـ PageView لعرض الفيديوهات
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_controllers[index].value.isPlaying) {
                      _controllers[index].pause(); // إيقاف الفيديو عند الضغط
                      _isPaused[index] = true;
                    } else {
                      _controllers[index].play(); // تشغيل الفيديو عند الضغط
                      _isPaused[index] = false;
                    }
                  });
                },
                child: Center(
                  child: _controllers[index].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controllers[index].value.aspectRatio,
                          child: VideoPlayer(_controllers[index]),
                        )
                      : const CircularProgressIndicator(), // تحميل الفيديو
                ),
              ),
              // عرض علامة عندما يكون الفيديو في حالة Pause
              if (_isPaused[index])
                Center(
                  child: Icon(
                    Icons.pause,
                    size: 100,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              BlocListener<HomeCubit, HomeState>(
                listenWhen: (previous, current) =>
                    current is ReelsLoading ||
                    current is ReelsSuccess ||
                    current is ReelsFailure,
                listener: (context, state) {
                  state.whenOrNull(
                    reelsLoading: () => log("Loading"),
                    reelsSuccess: (reels, videoControllers) =>
                        log("Success: $reels"),
                    reelsFailure: (apiErrorModel) =>
                        log("Failure : ${apiErrorModel.message}"),
                  );
                },
                child: const SizedBox.shrink(),
              )
            ],
          );
        },
      ),
    );
  }
}
