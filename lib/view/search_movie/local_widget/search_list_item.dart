import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/routes/app_pages.dart';
import '../../../model/movies_list_response.dart';
import '../../../utils.dart';
import '../../core/controllers/watch_controller.dart';

Widget SearchListItem(Results value, WatchController watchController) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  width: 120,
                  height: 120,
                  fit: BoxFit.fitHeight,
                  imageUrl: Utils.image_base_url + value.backdropPath,
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 180,
                    height: value.title.length > 20 ? 50 : 20,
                    child: Text(
                      value.title,
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                      softWrap: true,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(("Drama"),
                    style: TextStyle(color: Utils.gray, fontSize: 14))
                //Text(((value.genreIds[0] as Map<String, dynamic>)["name"] as String), style: TextStyle(color: Colors.black87, fontSize: 18))
              ],
            ),
          ],
        ),
        Positioned.fill(
            child: InkWell(
          onTap: () {
            watchController.selectedMovie.value = value;
            Get.toNamed(AppRoutes.MOVIE_TRAILER);
          },
          child: const Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.more_vert,
                color: Colors.blue,
                size: 30.0,
              ),
            ),
          ),
        )),
      ],
    ),
  );
}
