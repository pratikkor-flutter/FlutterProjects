import 'package:adabank/theme/shared_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
const double verificationStatus = 60;

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            "Notification",
            style: textStyle(16, FontWeight.w500, Colors.black),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width - 25,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 0.1, blurRadius: 20),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, left: 10),
                    child: Text(
                      "Transaction",
                      style: textStyle(14, FontWeight.w500, Colors.black45),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Divider(
                            height: 35,
                            indent: 45,
                            endIndent: 45,
                            color: Colors.black12,
                          ),
                          ListTile(
                            leading: SvgPicture.asset(
                                "assets/svg/notificationListTileIcon.svg"),
                            title: Text(
                              "successful transaction to ojaman, view and download the receipt",
                              style:
                                  textStyle(12, FontWeight.w400, Colors.black),
                            ),
                            subtitle: Text(
                              DateFormat.MMMMd().format(now),
                              style: textStyle(
                                  12, FontWeight.w400, Colors.black54),
                            ),
                            trailing: const Icon(
                              Icons.close_rounded,
                              color: Color.fromARGB(255, 16, 96, 72),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width - 25,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 0.1, blurRadius: 20),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 14, top: 12, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Complete Verification",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        Text(
                          "$verificationStatus%",
                          style: textStyle(
                            14,
                            FontWeight.w600,
                            const Color.fromARGB(255, 16, 96, 72),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.5,
                      horizontal: 20,
                    ),
                    child: LinearProgressIndicator(
                      value: verificationStatus / 100,
                      minHeight: 10,
                      color: const Color.fromARGB(255, 16, 96, 72),
                      backgroundColor: Colors.black12,
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Divider(
                            height: 35,
                            indent: 45,
                            endIndent: 45,
                            color: Colors.black12,
                          ),
                          ListTile(
                            leading: SvgPicture.asset(
                                "assets/svg/notificationListTileIcon.svg"),
                            title: Text(
                              "successful transaction to ojaman, view and download the receipt",
                              style:
                                  textStyle(12, FontWeight.w400, Colors.black),
                            ),
                            subtitle: Text(
                              DateFormat.MMMMd().format(now),
                              style: textStyle(
                                  12, FontWeight.w400, Colors.black54),
                            ),
                            trailing: const Icon(
                              Icons.close_rounded,
                              color: Color.fromARGB(255, 16, 96, 72),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 85),
          ],
        ),
      ),
    );
  }
}
