import 'package:spiders_task/core/networking/api_error_handler.dart';
import 'package:spiders_task/core/networking/api_result.dart';
import 'package:spiders_task/core/networking/api_service.dart';
import 'package:spiders_task/features/home/data/models/reels_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<ReelsModel>> getReels() async {
    try {
      final response = await _apiService.getReels();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }
}
