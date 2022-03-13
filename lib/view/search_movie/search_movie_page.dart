import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/strings.dart';
import 'package:movies_flutter_app/view/core/bindings/watch_controller.dart';
import '../../utils.dart';
import 'local_widget/search_list_item.dart';

class SearchMoviePage extends GetView<WatchController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black12,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Utils.light_gray,
          body: SafeArea(
              child: Obx(
            () => Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  height: Get.height * (1 / 10),
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 10, bottom: 10),
                  color: Colors.white,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Utils.light_gray,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Utils.light_gray,
                        )),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/search.svg',
                          matchTextDirection: true,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: Get.width / (1.5),
                          height: 30,
                          child: TextField(
                            controller: controller.searchController.value,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter movie name or category',
                            ),
                            onChanged: (value) {
                              controller.searchWord.value = value;
                              controller.filterMovies();
                            },
                            onSubmitted: (value) {
                              controller.searchWord.value = value;
                              controller.filterMovies();
                            },
                            autofocus: true,
                          ),
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            'assets/clear.svg',
                            matchTextDirection: true,
                            width: 30,
                            height: 30,
                          ),
                          onTap: () {
                            controller.searchController.value.clear();
                            controller.searchWord.value = "";
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: Get.height * (8 / 10) - 1,
                    width: Get.width,
                    color: Utils.light_gray,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      shrinkWrap: true,
                      itemCount: (controller.searchWord.isEmpty)
                          ? controller.allMovies.value.length
                          : controller.filteredMovies.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchListItem((controller.searchWord.isEmpty)
                            ? controller.allMovies.value[index]
                            : controller.filteredMovies.value[index], controller);
                      },
                    ))
              ],
            ),
          )),
          bottomNavigationBar: SizedBox(
              height: 54,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: Utils.dark_purple,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Utils.dark_purple,
                              spreadRadius: 0,
                              blurRadius: 10),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: BottomNavigationBar(
                          currentIndex: 1,
                          selectedIconTheme: IconThemeData(color: Colors.white),
                          unselectedIconTheme:
                              IconThemeData(color: Colors.black12),
                          backgroundColor: Utils.dark_purple,
                          selectedItemColor: Colors.white,
                          type: BottomNavigationBarType.fixed,
                          unselectedItemColor: Utils.gray,
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: Icon(
                                Icons.dashboard,
                                color: Utils.gray,
                              ),
                              label: AppStrings.dashboard,
                            ),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.play_circle_fill_outlined,
                                  color: Utils.gray,
                                ),
                                activeIcon: Icon(
                                  Icons.play_circle_fill_outlined,
                                ),
                                label: AppStrings.watch),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.perm_media,
                                  color: Utils.gray,
                                ),
                                label: AppStrings.media_lib),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.menu_outlined,
                                  color: Utils.gray,
                                ),
                                activeIcon: Icon(
                                  Icons.menu_outlined,
                                  color: Utils.gray,
                                ),
                                label: AppStrings.more)
                          ],
                        ),
                      )),
                ],
              ))),
    );
  }
}
