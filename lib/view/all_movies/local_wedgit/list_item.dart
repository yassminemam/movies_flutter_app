import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_flutter_app/utils.dart';
import 'package:movies_flutter_app/view/core/controllers/watch_controller.dart';
import '../../../model/movies_list_response.dart';
import '../../routes/app_pages.dart';

Widget ListItem(Results value, WatchController controller) {
  return InkWell(
    onTap: () {
      controller.selectedMovie.value = value;
      Get.toNamed(AppRoutes.MOVIE_TRAILER);
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              width: 500,
              height: 180,
              fit: BoxFit.fill,
              imageUrl: Utils.image_base_url + value.backdropPath,
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          Container(
            height: 180,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    value.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}
