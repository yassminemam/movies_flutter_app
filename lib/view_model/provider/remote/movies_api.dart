import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_flutter_app/utils.dart';

class MoviesApi{
  final Dio _dio = Get.find<Dio>();
  String getMoviesListURL = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Utils.api_key}';
  Future  getMoviesList() async {
    try {
      final response = await _dio.get(getMoviesListURL);
      return response;
    } on DioError catch (dioError) {
      return dioError.response;
    }
  }

  Future  getMovieImagesList(String movieId) async {
    try {
      final response = await _dio.get("https://api.themoviedb.org/3/movie/${movieId}/images?api_key=${Utils.api_key}");
      return response;
    } on DioError catch (dioError) {
      return dioError.response;
    }
  }
}