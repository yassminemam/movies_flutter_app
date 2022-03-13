import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/routes/app_pages.dart';

import '../core/controllers/watch_controller.dart';

class MovieTrailerPage extends GetView<WatchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => FlickVideoPlayer(
                flickManager: controller.flickManager.value,
                wakelockEnabledFullscreen: true,
              )),
          Positioned.fill(
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/clear.svg',
                        matchTextDirection: true,
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      onTap: () {
                        Get.offAndToNamed(AppRoutes.MOVIE_DETAILS);
                      },
                    ))),
          ),
        ],
      ),
    );
  }
}
