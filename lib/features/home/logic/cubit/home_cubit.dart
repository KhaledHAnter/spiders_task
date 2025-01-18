import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spiders_task/core/networking/api_error_model.dart';
import 'package:spiders_task/features/home/data/models/reels_model.dart';
import 'package:spiders_task/features/home/data/repos/home_repo.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:chewie/chewie.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(const HomeState.initial());

  List<ReelModel> reels = [];
  List<ChewieController> chewieControllers = [];
  List<bool> isPaused = [];
  final CacheManager _cacheManager = DefaultCacheManager();
  PageController pageController = PageController();

  String? nextPageUrl;
  bool isLoadingMore = false;

  void emitReelsStates() async {
    emit(const HomeState.reelsLoading(
        isApiLoading: true, isVideoLoading: false));

    final result = await repo.getReels(5);
    result.when(success: (data) {
      reels = data.reels ?? [];
      nextPageUrl = data.links?.next;
      emit(HomeState.reelsSuccess(reels, chewieControllers, DateTime.now()));
      _initializeVideoControllers();
    }, error: (error) {
      emit(HomeState.reelsFailure(error));
    });
  }

  void loadMoreReels() async {
    if (isLoadingMore || nextPageUrl == null) return;

    isLoadingMore = true;

    final nextPage = int.parse(nextPageUrl!.split('page=')[1]);

    try {
      final result = await repo.getReels(nextPage);

      result.when(success: (data) {
        if (data.reels != null) {
          reels.addAll(data.reels!);
          nextPageUrl = data.links?.next;
          // emit(
          //     HomeState.reelsSuccess(reels, chewieControllers, DateTime.now()));
          _initializeVideoControllersForNewReels(data.reels!);
        }
      }, error: (error) {
        print("Error loading more reels: $error");
      });
    } catch (e) {
      print("Error loading more reels: $e");
    } finally {
      isLoadingMore = false;
    }
  }

  Future<void> _initializeVideoControllersForNewReels(
      List<ReelModel> newReels) async {
    for (var reel in newReels) {
      final videoUrl = reel.video ?? '';
      final file = await _getCachedVideo(videoUrl);
      VideoPlayerController controller;

      if (file != null) {
        controller = VideoPlayerController.file(file);
      } else {
        controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      }

      try {
        await controller.initialize();
        ChewieController chewieController = ChewieController(
          videoPlayerController: controller,
          autoPlay: false,
          looping: true,
          showControls: false,
        );

        chewieControllers.add(chewieController);
        isPaused.add(false);

        emit(HomeState.reelsSuccess(reels, chewieControllers, DateTime.now()));
      } catch (e) {
        log("Error initializing video controller: $e");
      }
    }
  }

  Future<void> _initializeVideoControllers() async {
    for (var reel in reels) {
      final videoUrl = reel.video ?? '';
      if (reels.length <= 10) {
        emit(const HomeState.reelsLoading(
          isApiLoading: false,
          isVideoLoading: true,
        ));
      }

      final file = await _getCachedVideo(videoUrl);
      VideoPlayerController controller;

      if (file != null) {
        controller = VideoPlayerController.file(file);
      } else {
        controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      }

      await controller.initialize();
      ChewieController chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: false,
        looping: true,
        showControls: false,
      );

      chewieControllers.add(chewieController);
      isPaused.add(false);

      emit(HomeState.reelsSuccess(reels, chewieControllers, DateTime.now()));
    }
  }

  Future<File?> _getCachedVideo(String url) async {
    try {
      final fileInfo = await _cacheManager.getFileFromCache(url);
      return fileInfo?.file;
    } catch (e) {
      print("Error getting cached video: $e");
      return null;
    }
  }

  void startVideo(int index) async {
    chewieControllers[index].play();
    isPaused[index] = false;
  }

  void playVideo(int index) {
    if (isPaused[index]) {
      chewieControllers[index].play();
      isPaused[index] = false;
    } else {
      chewieControllers[index].pause();
      isPaused[index] = true;
    }
  }

  void resetVideo(int index) {
    chewieControllers[index].seekTo(Duration.zero);
    chewieControllers[index].play();
    isPaused[index] = false;
  }
}
