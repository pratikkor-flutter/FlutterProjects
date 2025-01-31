import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:newscircle/api/api_manipulation.dart';
import 'package:newscircle/controller/database_controller.dart';
import 'package:newscircle/model/news_model.dart';
import 'package:newscircle/theme/shared_style.dart';
import 'package:newscircle/controller/home_controller.dart';
import 'package:newscircle/view/news_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
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
              const SizedBox(height: 8),
              // tabbar with 2 tabs top headlines & recently viewed
              TabBar(
                controller: Get.find<HomeController>().homeTabController,
                labelColor: const Color(0xFF0056D2),
                indicatorColor: const Color(0xFF0056D2),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle:
                    textStyle(12, FontWeight.w400, Colors.black45),
                tabs: const [
                  Tab(
                    text: 'top headlines',
                  ),
                  Tab(
                    text: 'recently viewed',
                  ),
                ],
              ),
              Expanded(
                // tabbar view with listview of top headlines fetched from api & recently viewed news fetched from sqflite
                child: TabBarView(
                  controller: Get.find<HomeController>().homeTabController,
                  children: [
                    RefreshIndicator(
                      color: const Color(0xFF0056D2),
                      onRefresh: () async {
                        topHeadlinesData.clear();
                        ApiManipulation.getTopHeadlines();
                      },
                      child: Obx(
                        () => topHeadlinesData.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircularProgressIndicator(
                                      color: Color(0xFF0056D2),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Just a moment... Bringing you the top stories!',
                                      style: textStyle(
                                        12,
                                        FontWeight.w400,
                                        const Color(0xFF0056D2),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.only(top: 8),
                                itemCount: topHeadlinesData.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      try {
                                        await DatabaseController().insertNews(
                                          topHeadlinesData[index].toMap(),
                                        );
                                      } catch (ex) {
                                        log(ex.toString());
                                      } finally {
                                        NewsDetailScreen.selectedNewsDetails =
                                            topHeadlinesData[index];
                                        Get.toNamed('/detail');
                                      }
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: width,
                                          height: 250,
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Image.network(
                                            topHeadlinesData[index].urlToImage!,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFF0056D2),
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/newscircle.png',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 8,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(14),
                                                bottomRight:
                                                    Radius.circular(14),
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
                                              topHeadlinesData[index].title ==
                                                      null
                                                  ? '-'
                                                  : topHeadlinesData[index]
                                                      .title!,
                                              style: textStyle(
                                                  12,
                                                  FontWeight.w500,
                                                  Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                    Obx(
                      () => recentViewedNewsData.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/noViews.png'),
                                Text(
                                  'No Recent Views!',
                                  style: textStyle(
                                    16,
                                    FontWeight.w500,
                                    const Color(0xFF0056D2),
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.only(top: 8),
                              itemCount: recentViewedNewsData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    NewsDetailScreen.selectedNewsDetails =
                                        recentViewedNewsData[index];
                                    Get.toNamed('/detail');
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: width,
                                        height: 250,
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Image.network(
                                          recentViewedNewsData[index]
                                              .urlToImage!,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: Color(0xFF0056D2),
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/newscircle.png',
                                              fit: BoxFit.cover,
                                            );
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 8,
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
                                            recentViewedNewsData[index].title!,
                                            style: textStyle(12,
                                                FontWeight.w500, Colors.white),
                                          ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.toNamed('/explore');
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
            'Explore',
            style: textStyle(14, FontWeight.w500, Colors.white),
          ),
        ),
      ),
    );
  }
}
