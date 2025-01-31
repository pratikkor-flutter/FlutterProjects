import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newscircle/api/api_manipulation.dart';
import 'package:newscircle/theme/shared_style.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  static String selectedCategory = '';
  final ScrollController scrollController = ScrollController();
  final List<Map<String, String>> categoryData = const [
    {
      'title': 'Business',
      'imagePath': 'assets/images/business.png',
    },
    {
      'title': 'Sports',
      'imagePath': 'assets/images/sports.png',
    },
    {
      'title': 'Healthcare',
      'imagePath': 'assets/images/health.png',
    },
    {
      'title': 'Technology',
      'imagePath': 'assets/images/tech.png',
    },
  ];
  final List<String> popularSourcesData = const [
    'TechCrunch',
    'CNN',
    'Bloomberg',
    'BBC-News'
  ];
  // not decided for subscription plan now
  final List<String> subscriptionData = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/newscircle.png',
                      height: 50,
                    ),
                    const SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                        text: 'NewsCircle\n',
                        style: textStyle(
                          18,
                          FontWeight.w600,
                          const Color(0xFF0056D2),
                        ),
                        children: [
                          TextSpan(
                            text: DateFormat('EEEE, MMM d').format(
                              DateTime.now(),
                            ),
                            style: textStyle(
                              12,
                              FontWeight.w400,
                              Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(
                      height: 45,
                      child: Icon(
                        Icons.notifications_none_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.35,
                    child: const Divider(
                      color: Colors.black26,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'Categories',
                    style: textStyle(
                      14,
                      FontWeight.w600,
                      Colors.black54,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.35,
                    child: const Divider(
                      color: Colors.black26,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categoryData.length,
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          ApiManipulation.getNewsOfCategory(
                            categoryData[index]['title']!.toLowerCase(),
                          );
                          selectedCategory =
                              categoryData[index]['title']!.toLowerCase();
                          Get.toNamed('/category');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0056D2),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                categoryData[index]['imagePath']!,
                                height: 100,
                                color: Colors.white60,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        categoryData[index]['title']!,
                        style: textStyle(
                          14,
                          FontWeight.w500,
                          Colors.black,
                        ),
                      ),
                    ],
                  );
                },
                shrinkWrap: true,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.3,
                    child: const Divider(
                      color: Colors.black26,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'Popular Sources',
                    style: textStyle(
                      14,
                      FontWeight.w600,
                      Colors.black54,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.3,
                    child: const Divider(
                      color: Colors.black26,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularSourcesData.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: 15, top: 8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        ApiManipulation.getNewsFromChannel(
                          popularSourcesData[index].toLowerCase(),
                        );
                        selectedCategory =
                            popularSourcesData[index].toLowerCase();
                        Get.toNamed('/category');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0056D2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              popularSourcesData[index],
                              style: textStyle(
                                14,
                                FontWeight.w400,
                                Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.28,
                    child: const Divider(
                      color: Colors.black26,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'Your Subscriptions',
                    style: textStyle(
                      14,
                      FontWeight.w600,
                      Colors.black54,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.28,
                    child: const Divider(
                      color: Colors.black26,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: 15, top: 8, bottom: 90),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0056D2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoryData[index]['title']!,
                            style: textStyle(
                              14,
                              FontWeight.w400,
                              Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFF0056D2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                spreadRadius: 0.1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Text(
            'Home',
            style: textStyle(14, FontWeight.w500, Colors.white),
          ),
        ),
      ),
    );
  }
}
