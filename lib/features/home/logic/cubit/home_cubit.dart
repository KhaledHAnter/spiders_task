import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spiders_task/core/networking/api_error_model.dart';
import 'package:spiders_task/features/home/data/models/reels_model.dart';
import 'package:spiders_task/features/home/data/repos/home_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(const HomeState.initial());

  List<ReelModel> reels = [];

  void emitReelsStates() async {
    emit(const HomeState.reelsLoading());
    final result = await repo.getReels();
    result.when(success: (data) {
      reels = data.reels ?? [];
      emit(HomeState.reelsSuccess(reels));
    }, error: (error) {
      emit(HomeState.reelsFailure(error));
    });
  }
}
