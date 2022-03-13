import 'package:dio/dio.dart';

import '../../../view_model/provider/local/movies_local_repo.dart';
import '../../../view_model/provider/remote/movies_api.dart';
import '../controllers/watch_controller.dart';
import 'package:get/get.dart';
class WatchBindings extends Bindings {
  // The class lazy inject all Dashboard controllers
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<MoviesApi>(MoviesApi());
    Get.put<MoviesLocalRepo>(MoviesLocalRepo());;
    Get.lazyPut(() => WatchController());

  }
}
