import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/routes/app_pages.dart';
import 'package:video_player/video_player.dart';
import '../../../model/movies_list_response.dart';
import '../../../view_model/provider/remote/movies_api.dart';

class WatchController extends GetxController {
  final MoviesApi _moviesApi = Get.find<MoviesApi>();
  Rx<List<Results>> allMovies = Rx<List<Results>>([]);
  Rx<List<Results>> filteredMovies = Rx<List<Results>>([]);
  Rx<Results?> selectedMovie = Rx<Results?>(null);
  RxString searchWord = "".obs;
  String movieURL = "http://movietrailers.apple.com/movies/sony_pictures/alpha/alpha-trailer-2_h480p.mov";
  late Rx<FlickManager> flickManager = Rx<FlickManager>(FlickManager(
    videoPlayerController: VideoPlayerController.network(movieURL),
    onVideoEnd: ()=> Get.offAndToNamed(AppRoutes.MOVIE_DETAILS)
  ));
  final Rx<TextEditingController> searchController =
      TextEditingController(text: "").obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllMoviesList();
  }

  @override
  void dispose() {
    flickManager.value.dispose();
    super.dispose();
  }

  getAllMoviesList() async {
    var moviesListResponse = await _moviesApi.getMoviesList();
    if (moviesListResponse.statusCode == 200) {
      var responseObj = MoviesListResponse.fromJson(moviesListResponse.data);
      allMovies.value = responseObj.results;
    } else {
      Get.snackbar(
        'Unexpected error',
        moviesListResponse.data['messageEn'],
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: const EdgeInsets.all(10),
      );
    }
  }

  void filterMovies() {
    filteredMovies.value = [];
    for (int m = 0; m < allMovies.value.length; m++) {
      if (allMovies.value[m].title
          .toLowerCase()
          .contains(searchWord.value.toLowerCase())) {
        filteredMovies.value.add(allMovies.value[m]);
      }
    }
  }
}
