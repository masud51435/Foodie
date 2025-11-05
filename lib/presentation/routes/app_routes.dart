import 'package:get/get.dart';
import '../modules/home_page/bindings/home_bindings.dart';
import '../modules/home_page/views/home_screen.dart';

class AppRoutes {
  static const String home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
  ];
}
