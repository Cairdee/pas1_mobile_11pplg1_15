import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_15/Binding/binding.dart';
import 'package:pas1_mobile_11pplg1_15/login/log_view.dart';
import 'package:pas1_mobile_11pplg1_15/menus/liga/liga_api.dart';
import 'package:pas1_mobile_11pplg1_15/menus/favorite.dart';
import 'package:pas1_mobile_11pplg1_15/menus/profile.dart';
import 'package:pas1_mobile_11pplg1_15/register/PostView.dart' as register;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => register.PostView()),
        GetPage(name: '/login', page: () => LogView()),
        GetPage(
          name: '/anime',
          page: () => AnimeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/favorite',
          page: () => FavoritePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/profile',
          page: () => const Profile(),
          binding: HomeBinding(),
        ),
      ],
      initialRoute: '/',
      home: LogView(),
    );
  }
}