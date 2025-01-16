import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spiders_task/core/networking/api_constants.dart';
import 'package:spiders_task/features/home/data/models/reels_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.reelsEndpoint)
  Future<ReelsModel> getReels();
}
