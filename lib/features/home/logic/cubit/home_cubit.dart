import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spiders_task/core/networking/api_error_model.dart';
import 'package:spiders_task/features/home/data/models/reels_model.dart';
import 'package:spiders_task/features/home/data/repos/home_repo.dart';
import 'package:video_player/video_player.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(const HomeState.initial());

  List<ReelModel> reels = [];
  PageController pageController = PageController();
  List<VideoPlayerController> videoControllers = [];
  late List<bool> _isPaused;

  void emitReelsStates() async {
    emit(const HomeState.reelsLoading());
    final result = await repo.getReels();
    result.when(success: (data) {
      reels = data.reels ?? [];
      videoControllers = getVideoControllers();
      for (var controller in videoControllers) {
        controller.setLooping(true);
      }
      generatePausedList();
      emit(HomeState.reelsSuccess(reels, videoControllers));
    }, error: (error) {
      emit(HomeState.reelsFailure(error));
    });
  }

  List<VideoPlayerController> getVideoControllers() {
    final List<VideoPlayerController> urls = reels
        .map((reel) =>
            VideoPlayerController.networkUrl(Uri.parse(reel.video ?? ''))
              ..initialize())
        .toList();
    return urls;
  }

  void generatePausedList() {
    _isPaused = List.generate(videoControllers.length, (index) => false);
  }

  void playVideo(int index) {
    if (_isPaused[index]) {
      videoControllers[index].play();
      _isPaused[index] = false;
    } else {
      videoControllers[index].pause();
      _isPaused[index] = true;
    }
  }
}
