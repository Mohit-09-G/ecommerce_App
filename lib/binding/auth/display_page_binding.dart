import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/displaypage/display_page_cotroller.dart';

class DisplayPageBinding extends Bindings {
  final int id;

  DisplayPageBinding({required this.id});
  @override
  void dependencies() {
    // Get.lazyPut<DisplayPageCotroller>(() => getIt<DisplayPageCotroller>());
    Get.lazyPut<DisplayPageController>(
        () => getIt<DisplayPageController>(param1: id));
  }
}
