part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.reelsLoading() = ReelsLoading;
  const factory HomeState.reelsSuccess(List<ReelModel> reels) = ReelsSuccess;
  const factory HomeState.reelsFailure(ApiErrorModel apiErrorModel) =
      ReelsFailure;
}
