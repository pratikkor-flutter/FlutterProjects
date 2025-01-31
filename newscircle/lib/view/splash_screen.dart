import 'package:flutter/material.dart';
import 'package:newscircle/theme/shared_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        color: Colors.white,
        child: Image.asset(
          'assets/images/newscircle.png',
        ),
      ),
    );
  }
}
