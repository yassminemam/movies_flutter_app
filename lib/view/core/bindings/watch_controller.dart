import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../model/movies_list_response.dart';
import '../../../view_model/provider/remote/movies_api.dart';

class WatchController extends GetxController {
  final MoviesApi _walletApi = Get.find<MoviesApi>();
  Rx<List<Results>> allMovies = Rx<List<Results>>([]);
  Rx<List<Results>> filteredMovies = Rx<List<Results>>([]);
  Rx<Results?> selectedMovie = Rx<Results?>(null);
  RxString searchWord = "".obs;
  final Rx<TextEditingController> searchController =
      TextEditingController(text: "").obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllMoviesList();
  }

  getAllMoviesList() async {
    var moviesListResponse = await _walletApi.getMoviesList();
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
