import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spiders_task/core/networking/api_service.dart';
import 'package:spiders_task/core/networking/dio_factory.dart';
import 'package:spiders_task/features/home/data/repos/home_repo.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
