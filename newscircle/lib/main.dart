import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newscircle/bindings/home_controller_binding.dart';
import 'package:newscircle/bindings/session_binding.dart';
import 'package:newscircle/theme/shared_style.dart';
import 'package:newscircle/view/category_news_screen.dart';
import 'package:newscircle/view/explore_screen.dart';
import 'package:newscircle/view/home_screen.dart';
import 'package:newscircle/view/news_detail_screen.dart';
import 'package:newscircle/view/onboarding_screen.dart';
import 'package:newscircle/view/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const NewsCircle());
}

class NewsCircle extends StatelessWidget {
  const NewsCircle({super.key});

  @override
  Widget build(BuildContext context) {
    setDeviceSize(
      deviceWidth: MediaQuery.sizeOf(context).width,
      deviceHeight: MediaQuery.sizeOf(context).height,
    );
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0056D2),
      ),
      initialRoute: '/',
      getPages: [
        // initial route is of splash screen
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
          binding: SessionBinding(),
        ),
        GetPage(
          name: '/onBoarding',
          page: () => OnBoardingScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          binding: HomeControllerBinding(),
        ),
        GetPage(
          name: '/explore',
          page: () => ExploreScreen(),
        ),
        GetPage(
          name: '/category',
          page: () => const CategoryNewsScreen(),
        ),
        GetPage(
          name: '/detail',
          page: () => const NewsDetailScreen(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
