import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/view/all_movies/watch_page.dart';
import 'package:movies_flutter_app/view/core/bindings/watch_bindings.dart';
import 'package:movies_flutter_app/view/routes/app_pages.dart';

void main() {
  WatchBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WatchPage(),
      initialBinding: WatchBindings(),
      getPages: AppPages.pages,
    );
  }
}
