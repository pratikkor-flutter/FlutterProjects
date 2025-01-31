import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscircle/controller/session_controller.dart';
import 'package:newscircle/theme/shared_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final PageController _pageController = PageController();

  // widget for pageview children
  Stack _onboardingScreenWidget(
    BuildContext context, {
    required String title,
    required String message,
    required String imagePath,
  }) {
    return Stack(
      children: [
        Positioned(
          top: height * 0.1,
          left: 45,
          right: 45,
          child: SizedBox(
            width: width,
            height: height * 0.5,
            child: Image(
              image: AssetImage(imagePath),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF0056D2),
                  ),
                );
              },
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: height * 0.63,
          left: 25,
          right: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle(16, FontWeight.w500, Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                message,
                style: textStyle(12, FontWeight.w400, Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _onboardingScreenWidget(
                  context,
                  title: 'Welcome to NewsCircle!',
                  message:
                      'Stay informed with real-time news updates across various categories, all at your fingertips. Discover a seamless reading experience like never before!',
                  imagePath: 'assets/images/onboarding1.jpg',
                ),
                _onboardingScreenWidget(
                  context,
                  title: 'Recent Updates & Viewed Content!',
                  message:
                      'Easily access the latest news and revisit articles you’ve explored with our recent views feature, even offline!',
                  imagePath: 'assets/images/onboarding2.jpg',
                ),
                _onboardingScreenWidget(
                  context,
                  title: 'Get Top Headlines & Stay Update!',
                  message:
                      'Explore trending stories and top headlines instantly. Stay ahead with the news that matters most to you.',
                  imagePath: 'assets/images/onboarding3.jpg',
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xFF0056D2),
              dotColor: Color(0x3F0056D2),
              expansionFactor: 4.5,
              dotHeight: 5.5,
              dotWidth: 5.5,
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              SessionController.storeUserToken(loginStatus: true);
              Get.offNamed('/home');
            },
            child: Container(
              width: double.maxFinite,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0056D2),
                    Color(0xFF0056D2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: textStyle(18, FontWeight.w500, Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
