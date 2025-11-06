import 'package:foodie/backend/public_api.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(publicApi: Get.find<PublicApi>()));
  }
}
