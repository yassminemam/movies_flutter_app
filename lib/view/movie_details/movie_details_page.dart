import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/core/bindings/watch_controller.dart';
import '../../utils.dart';

class MovieDetailsPage extends GetView<WatchController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black12,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Obx(
          () => Column(
            children: [
              Container(
                height: Get.height / 2,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      height: Get.height / 2,
                      fit: BoxFit.fitHeight,
                      imageUrl: Utils.image_base_url +
                          controller.selectedMovie.value!.backdropPath,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
