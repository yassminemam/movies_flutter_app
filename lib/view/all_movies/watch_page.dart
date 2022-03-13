import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/core/bindings/watch_controller.dart';
import 'package:movies_flutter_app/view/routes/app_pages.dart';
import '../../strings.dart';
import '../../utils.dart';
import 'local_wedgit/list_item.dart';

class WatchPage extends GetView<WatchController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black12,
      home: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.SEARCH);
                  },
                  child: SvgPicture.asset(
                    'assets/search.svg',
                    matchTextDirection: true,
                    width: 50,
                    height: 50,
                  ),
              )
            ],
            title: Transform(
                transform: Matrix4.translationValues(20.0, 0.0, 0.0),
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    AppStrings.watch,
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                )),
          ),
          body: SafeArea(
              child: Obx(()=> Container(
                  color: Utils.light_gray,
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    shrinkWrap: false,
                    itemCount: controller.allMovies.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(controller.allMovies.value[index], controller);
                    },
                  )))),
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
