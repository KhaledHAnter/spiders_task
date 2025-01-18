import 'dart:io';

import 'package:bloc/bloc.dart';

///
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spiders_task/core/networking/api_error_model.dart';
import 'package:spiders_task/features/home/data/models/reels_model.dart';
import 'package:spiders_task/features/home/data/repos/home_repo.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(const HomeState.initial());

  List<ReelModel> reels = [];
  List<VideoPlayerController> videoControllers = [];
  List<bool> isPaused = []; // سيضاف هنا عنصر لكل فيديو
  final CacheManager _cacheManager = DefaultCacheManager();
  PageController pageController = PageController();

  // Fetch data from API and emit success
  void emitReelsStates() async {
    emit(const HomeState.reelsLoading(
        isApiLoading: true, isVideoLoading: false)); // Loading for API
    final result = await repo.getReels();
    result.when(success: (data) async {
      reels = data.reels ?? [];
      emit(HomeState.reelsSuccess(reels, videoControllers,
          DateTime.now())); // Emit success after API data
      await _initializeVideoControllers(); // Start video initialization
    }, error: (error) {
      emit(HomeState.reelsFailure(error));
    });
  }

  // Initialize video controllers and cache videos
  Future<void> _initializeVideoControllers() async {
    for (var reel in reels) {
      final videoUrl = reel.video ?? '';

      // Emit loading state for video initialization
      emit(const HomeState.reelsLoading(
          isApiLoading: false, isVideoLoading: true));

      // Start initializing video controller
      final file = await _getCachedVideo(videoUrl);
      VideoPlayerController controller;

      if (file != null) {
        controller = VideoPlayerController.file(file);
      } else {
        controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      }

      // Initialize the controller
      await controller.initialize();

      // Add the controller to the list
      videoControllers.add(controller);

      // Add corresponding paused state for the video controller
      isPaused.add(false); // Initially, the video is paused

      // Set looping for video
      controller.setLooping(true);

      // Emit success once the video is initialized
      emit(HomeState.reelsSuccess(reels, videoControllers, DateTime.now()));

      // Cache video after initialization
      _cacheVideo(videoUrl);
    }
  }

  // Function to cache video
  Future<void> _cacheVideo(String url) async {
    try {
      await _cacheManager.downloadFile(url);
    } catch (e) {
      print("Error caching video: $e");
    }
  }

  // Get video from cache if available
  Future<File?> _getCachedVideo(String url) async {
    try {
      final fileInfo = await _cacheManager.getFileFromCache(url);
      return fileInfo?.file;
    } catch (e) {
      print("Error getting cached video: $e");
      return null;
    }
  }

  // Play or pause video
  void playVideo(int index) {
    if (isPaused[index]) {
      videoControllers[index].play();
      isPaused[index] = false;
    } else {
      videoControllers[index].pause();
      isPaused[index] = true;
    }
  }

  // Reset video to the beginning
  void resetVideo(int index) {
    videoControllers[index].seekTo(Duration.zero);
    videoControllers[index].play();
    isPaused[index] = false;
  }
}
