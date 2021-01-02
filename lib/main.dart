import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_finder/pages/gifs/gifs_page.dart';
import 'package:gif_finder/pages/home/binding/home_binding.dart';
import 'package:gif_finder/pages/home/home_page.dart';
import 'package:gif_finder/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: myThemeLight,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/gif_page',
          page: () => GifsPage(),
        ),
      ],
    );
  }
}
