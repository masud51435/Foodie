import 'package:foodie/backend/dio_client.dart';
import 'package:foodie/backend/links.dart';
import 'package:foodie/backend/public_api.dart';
import 'package:get/get.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClient(baseUrl: Links.baseUrl), fenix: true);
    Get.lazyPut<PublicApi>(() => PublicApi(client: Get.find()), fenix: true);
  }
}
