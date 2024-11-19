import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_15/controller/favorite_controller.dart';
import 'package:pas1_mobile_11pplg1_15/controller/profile_controller.dart';
import 'package:pas1_mobile_11pplg1_15/menus/liga/liga_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeController>(() => AnimeController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
