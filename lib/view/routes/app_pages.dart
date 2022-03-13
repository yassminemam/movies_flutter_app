import 'package:movies_flutter_app/view/all_movies/watch_page.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/core/bindings/watch_bindings.dart';

import '../movie_details/movie_details_page.dart';
import '../movie_trailer/movie_trailer_page.dart';
import '../search_movie/search_movie_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.WATCH,
      page: () => WatchPage(),
      fullscreenDialog: true,
      binding: WatchBindings(),
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => SearchMoviePage(),
      fullscreenDialog: true,
      binding: WatchBindings(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_DETAILS,
      page: () => MovieDetailsPage(),
      fullscreenDialog: true,
      binding: WatchBindings(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_TRAILER,
      page: () => MovieTrailerPage(),
      fullscreenDialog: true,
      binding: WatchBindings(),
    )
  ];
}
