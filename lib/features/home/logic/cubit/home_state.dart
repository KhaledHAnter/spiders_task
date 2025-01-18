part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // تعديل حالة الـ loading لتشمل نوعين من التحميل
  const factory HomeState.reelsLoading({
    required bool isApiLoading, // تحديد ما إذا كنا في انتظار API
    required bool isVideoLoading, // تحديد ما إذا كنا في انتظار تهيئة الفيديوهات
  }) = ReelsLoading;

  // حالة النجاح تشمل reels، videoControllers، و timestamp
  const factory HomeState.reelsSuccess(
    List<ReelModel> reels,
    List<ChewieController> videoControllers,
    DateTime timestamp, // تاريخ ووقت التهيئة
  ) = ReelsSuccess;

  // حالة الفشل تبقى كما هي
  const factory HomeState.reelsFailure(ApiErrorModel apiErrorModel) =
      ReelsFailure;
}
