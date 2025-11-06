import 'package:get/get.dart';
import 'package:foodie/presentation/common/bottom_nav_bar.dart';
import 'package:foodie/presentation/features/home/bindings/home_bindings.dart';
import 'package:foodie/presentation/features/home/view/home_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String bottomNavBar = '/bottomNavBar';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: bottomNavBar,
      page: () => const BottomNavBar(),
      binding: HomeBindings(),
    ),
  ];
}
