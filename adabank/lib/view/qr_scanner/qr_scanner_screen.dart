import 'package:adabank/view/transfer/transfer_detail_screen.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:adabank/controller/navigation_controller.dart';

// for camera permission, add this into your android\gradle.properties file
// dev.steenbakker.mobile_scanner.useUnbundled=true

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
              returnImage: true,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final List<String> splittedStringData =
                  barcodes.first.rawValue!.split(" | ");
              if (capture.image != null) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              shape: BoxShape.rectangle,
                              image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/person1.png",
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          title: Text(
                            splittedStringData.first,
                            style: textStyle(
                              18,
                              FontWeight.w500,
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          subtitle: Text(
                            "Bank - ${splittedStringData.last}",
                            style: textStyle(
                              12,
                              FontWeight.w400,
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          pushScreen(
                            context,
                            TransferDetailScreen(
                              transferContactDetail: {
                                'name': splittedStringData.first,
                                'profilePic': "assets/images/person1.png",
                                'bankNumber': splittedStringData.last,
                              },
                            ),
                          );
                        },
                        child: customButtonWidget(
                          context: context,
                          color: Theme.of(context).primaryColor,
                          title: "CHECK OUT",
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                );
              }
            },
          ),
          Positioned(
            left: 12,
            top: 18,
            child: GestureDetector(
              onTap: () {
                popScreen(context);
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
