import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newscircle/model/news_model.dart';
import 'package:newscircle/theme/shared_style.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  static NewsModel? selectedNewsDetails;

  void redirectToBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppBrowserView,
      );
    } else {
      Get.snackbar(
        'Warning!',
        'Could not launch URL! Error while redirecting to URL',
        colorText: const Color(0xFF0056D2),
        backgroundColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.55,
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.55,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.network(
                    selectedNewsDetails!.urlToImage!,
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
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/newscircle.png',
                        fit: BoxFit.contain,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: Offset(0, -4),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      '${selectedNewsDetails!.sourceName} - (${DateFormat('dMMMMy').format(DateTime.parse(selectedNewsDetails!.publishedAt!))})',
                      style: textStyle(12, FontWeight.w500, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF0056D2),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.57,
            left: 15,
            right: 15,
            bottom: 15,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedNewsDetails!.title!,
                  style: textStyle(14, FontWeight.w600, Colors.black),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  '${selectedNewsDetails!.description!}..read more',
                  style: textStyle(14, FontWeight.w400, Colors.black),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 22),
                GestureDetector(
                  onTap: () {
                    redirectToBrowser(selectedNewsDetails!.url!);
                  },
                  child: Text(
                    selectedNewsDetails!.url!,
                    style: textStyle(12, FontWeight.w300, Colors.blue[800]),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  '${selectedNewsDetails!.sourceName!},',
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                Text(
                  '${selectedNewsDetails!.author!},',
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                Text(
                  selectedNewsDetails!.publishedAt!,
                  style: textStyle(14, FontWeight.w400, Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
