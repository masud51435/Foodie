
import 'package:flutter/material.dart';
import 'package:foodie/backend/initial_binding.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/routes/app_routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foodie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.bottomNavBar,
      getPages: AppRoutes.routes,
    );
  }
}
