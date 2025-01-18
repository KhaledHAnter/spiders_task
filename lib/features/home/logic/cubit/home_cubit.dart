import 'dart:developer';
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

  String? nextPageUrl; // متغير لتخزين رابط الصفحة التالية
  bool isLoadingMore = false; // متغير للتحقق من عملية تحميل إضافية

  void emitReelsStates() async {
    emit(const HomeState.reelsLoading(
        isApiLoading: true, isVideoLoading: false));

    // تمرير الرقم الأول للصفحة
    final result = await repo.getReels(5); // طلب الصفحة الأولى
    result.when(success: (data) {
      reels = data.reels ?? [];
      nextPageUrl = data.links?.next;
      emit(HomeState.reelsSuccess(reels, videoControllers, DateTime.now()));
      _initializeVideoControllers();
    }, error: (error) {
      emit(HomeState.reelsFailure(error));
    });
  }

  void loadMoreReels() async {
    if (isLoadingMore || nextPageUrl == null) return;

    isLoadingMore = true;
    // emit(const HomeState.reelsLoading(
    //     isApiLoading: false, isVideoLoading: true));

    // استخراج رقم الصفحة من الرابط
    final nextPage = int.parse(nextPageUrl!.split('page=')[1]);

    try {
      final result = await repo.getReels(nextPage); // تمرير الصفحة التالية

      result.when(success: (data) {
        if (data.reels != null) {
          reels.addAll(data.reels!); // دمج الفيديوهات الجديدة مع القديمة
          nextPageUrl = data.links?.next; // تحديث رابط الصفحة التالية

          // تهيئة الفيديوهات الجديدة
          _initializeVideoControllersForNewReels(data.reels!);

          emit(HomeState.reelsSuccess(reels, videoControllers, DateTime.now()));
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

  // دالة لتحديث videoControllers و isPaused للفيديوهات الجديدة
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

      // تأكيد تهيئة الـ controller بشكل صحيح
      try {
        // ننتظر حتى تكتمل عملية التهيئة
        await controller.initialize();

        // بعد التهيئة بنجاح، نقوم بإضافة الفيديو الجديد
        videoControllers.add(controller);
        isPaused.add(false); // الفيديو يبدأ في وضع الإيقاف المؤقت

        // تحديث حالة الـ emit بمجرد إضافة الفيديو الجديد
        emit(HomeState.reelsSuccess(reels, videoControllers, DateTime.now()));
      } catch (e) {
        log("Error initializing video controller: $e");
      }
    }
  }

  // تهيئة الفيديوهات
  Future<void> _initializeVideoControllers() async {
    for (var reel in reels) {
      final videoUrl = reel.video ?? '';
      // Emit loading state for video initialization
      if (reels.length <= 10) {
        emit(const HomeState.reelsLoading(
            isApiLoading: false, isVideoLoading: true));
      }
      final file = await _getCachedVideo(videoUrl);
      VideoPlayerController controller;

      if (file != null) {
        controller = VideoPlayerController.file(file);
      } else {
        controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      }

      await controller.initialize();
      videoControllers.add(controller);
      isPaused.add(false); // تحديد حالة الإيقاف المؤقت للفيديو
      controller.setLooping(true);

      emit(HomeState.reelsSuccess(reels, videoControllers, DateTime.now()));
    }
  }

  // إرجاع الفيديو من الذاكرة المؤقتة
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
