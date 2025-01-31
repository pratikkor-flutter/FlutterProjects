import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RippleAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<AnimationController>? animationController;
  RxDouble sizeOfContainer = RxDouble(80), height = RxDouble(80);

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.1,
      duration: const Duration(seconds: 3),
    ).obs;

    animationController!.value.addListener(() {
      sizeOfContainer.value = animationController!.value.value;
    });

    animationController!.value.forward();

    animationController!.value.repeat();
  }

  @override
  void onClose() {
    animationController!.value.dispose();
    super.onClose();
  }

  Obx borderContainerForRippleAnimation(double size, Color color) {
    return Obx(
      () => Container(
        width: size * sizeOfContainer.value,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
          ),
        ),
      ),
    );
  }

  Widget containerForRipleAnimation(double size) {
    return Obx(
      () => Container(
        width: size * sizeOfContainer.value,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 16, 96, 72)
              .withOpacity(1.0 - animationController!.value.value),
        ),
      ),
    );
  }
}
