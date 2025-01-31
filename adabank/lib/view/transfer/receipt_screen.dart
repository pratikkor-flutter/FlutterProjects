import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/controller/transfer/transfer_screen_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double xFactor = 18, yFactor = 15;
    double height = size.height;
    double width = size.width;
    double startY = (height - height / 1.72) - yFactor;

    final path = Path();

    // Start from the top-left corner
    path.lineTo(0, 0);

    // Draw the left-side curve
    double xVal = 0;
    double yVal = startY;

    path.lineTo(xVal, yVal);

    double scale = 1.2;
    path.cubicTo(
      xVal,
      yVal,
      xVal,
      yVal + yFactor * scale,
      xVal + xFactor * scale,
      yVal + yFactor * scale,
    );
    xVal = xVal + xFactor * scale;
    yVal = yVal + yFactor * scale;

    double scale1 = 1;
    path.cubicTo(
      xVal,
      yVal,
      xVal + xFactor * scale1,
      yVal,
      xVal + xFactor * scale1,
      yVal + yFactor * scale1,
    );
    xVal = xVal + xFactor * scale1;
    yVal = yVal + yFactor * scale1;

    double scale2 = 1.2;
    path.cubicTo(
      xVal,
      yVal,
      xVal,
      yVal + yFactor * scale2,
      xVal - xFactor * scale2,
      yVal + yFactor * scale2,
    );
    xVal = xVal - xFactor * scale2;
    yVal = yVal + yFactor * scale2;

    path.lineTo(0, height);

    // Move to the right-side bottom
    path.lineTo(width, height);

    // Draw the right-side curve (mirror of left)
    xVal = width;
    yVal = (height - height / 2.23) - yFactor;

    path.lineTo(xVal, yVal);

    path.cubicTo(
      xVal,
      yVal,
      xVal,
      yVal - yFactor * scale2,
      xVal - xFactor * scale2,
      yVal - yFactor * scale2,
    );
    xVal = xVal - xFactor * scale2;
    yVal = yVal - yFactor * scale2;

    path.cubicTo(
      xVal,
      yVal,
      xVal - xFactor * scale1,
      yVal,
      xVal - xFactor * scale1,
      yVal - yFactor * scale1,
    );
    xVal = xVal - xFactor * scale1;
    yVal = yVal - yFactor * scale1;

    path.cubicTo(
      xVal,
      yVal,
      xVal,
      yVal - yFactor * scale,
      xVal + xFactor * scale,
      yVal - yFactor * scale,
    );
    xVal = xVal + xFactor * scale;
    yVal = yVal - yFactor * scale;

    path.lineTo(width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ReceiptScreen extends StatelessWidget {
  final Map<String, String> transferContactDetail;
  const ReceiptScreen({super.key, required this.transferContactDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        leading: GestureDetector(
          onTap: () {
            popScreen(context);
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(12)),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Text(
            "My Receipt",
            style: textStyle(20, FontWeight.w500, Colors.black),
          ),
          ClipPath(
            clipper: SideCutClipper(),
            child: Container(
              width: MediaQuery.sizeOf(context).width - 50,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 18,
                      ),
                      horizontalTitleGap: 25,
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(
                                transferContactDetail['profilePic']!,
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          transferContactDetail['name']!,
                          style: textStyle(18, FontWeight.w500, Colors.black),
                        ),
                      ),
                      subtitle: Text(
                        "Bank - ${transferContactDetail['bankNumber']!}",
                        style: textStyle(12, FontWeight.w400, Colors.black87),
                      ),
                    ),
                    const Divider(
                      height: 50,
                      color: Colors.black12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: textStyle(16, FontWeight.w500, Colors.black45),
                        ),
                        Text(
                          "\$${TransferScreenController.transferAmount}",
                          style: textStyle(16, FontWeight.w500, Colors.black45),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 50,
                      color: Colors.black12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Note",
                          style: textStyle(16, FontWeight.w500, Colors.black45),
                        ),
                        Text(
                          "-",
                          style: textStyle(16, FontWeight.w500, Colors.black45),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 50,
                      color: Colors.black12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Data Transaction",
                          style: textStyle(12, FontWeight.w500, Colors.black45),
                        ),
                        Text(
                          "Data Transaction",
                          style: textStyle(12, FontWeight.w500, Colors.black45),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Id Transaction",
                          style: textStyle(12, FontWeight.w500, Colors.black45),
                        ),
                        Text(
                          "Id Transaction@\nId Transaction",
                          style: textStyle(12, FontWeight.w500, Colors.black45),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 75,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width - 50,
            height: 75,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: textStyle(16, FontWeight.w500, Colors.black45),
                ),
                Obx(
                  () => DropdownButton(
                    style: textStyle(15, FontWeight.w500, Colors.black87),
                    dropdownColor: Colors.white,
                    underline: const SizedBox(),
                    alignment: Alignment.center,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black87,
                    ),
                    value: TransferScreenController.categoryValue.value,
                    items: TransferScreenController.categoriesList,
                    onChanged: (value) {
                      TransferScreenController.categoryValue.value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              TransferScreenController.initTransaction();
              popScreen(context);
              popScreen(context);
            },
            child: customButtonWidget(
              context: context,
              color: Theme.of(context).primaryColor,
              title: "DOWNLOAD INVOICE",
              margin: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
