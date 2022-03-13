import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/strings.dart';
import 'package:movies_flutter_app/view/core/bindings/watch_controller.dart';
import '../../utils.dart';

class MovieDetailsPage extends GetView<WatchController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black12,
      home: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height / 4,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    AppStrings.watch,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.selectedMovie.value!.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 243,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Utils.blue,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Utils.blue,
                                      )),
                                  child: const Center(
                                    child: Text(
                                      AppStrings.get_tickets,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 243,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: Utils.blue,
                                      )),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          AppStrings.watch_trailer,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    AppStrings.genres,
                    style: TextStyle(
                        color: Utils.extra_dark_gray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Utils.green,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Utils.green,
                            )),
                        child: const Center(
                            child: Text(
                          "Action",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Utils.pink,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Utils.pink,
                            )),
                        child: const Center(
                            child: Text(
                          "Thriller",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Utils.purple,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Utils.purple,
                            )),
                        child: const Center(
                            child: Text(
                          "Science",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Utils.yellow,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Utils.yellow,
                            )),
                        child: const Center(
                            child: Text(
                          "Fiction",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                    ])),
                const Padding(
                    padding: EdgeInsets.only(right: 30, left: 30, bottom: 20),
                    child: Divider(
                      color: Utils.gray,
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                  child: Text(
                    AppStrings.overview,
                    style: TextStyle(
                        color: Utils.extra_dark_gray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                  child: Text(
                    controller.selectedMovie.value!.overview,
                    style: const TextStyle(
                        color: Utils.gray,
                        fontSize: 16,),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
