import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:newscircle/api/api_manipulation.dart';
import 'package:newscircle/controller/database_controller.dart';
import 'package:newscircle/model/news_model.dart';
import 'package:newscircle/theme/shared_style.dart';
import 'package:newscircle/view/explore_screen.dart';
import 'package:newscircle/view/news_detail_screen.dart';

class CategoryNewsScreen extends StatelessWidget {
  const CategoryNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          ExploreScreen.selectedCategory.toUpperCase(),
          style: textStyle(
            18,
            FontWeight.w600,
            const Color(0xFF0056D2),
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0056D2),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          color: const Color(0xFF0056D2),
          onRefresh: () async {
            categoryNewsData.clear();
            ApiManipulation.getNewsOfCategory(ExploreScreen.selectedCategory);
          },
          child: Obx(
            () => categoryNewsData.isEmpty
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
                    itemCount: categoryNewsData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          try {
                            await DatabaseController().insertNews(
                              categoryNewsData[index].toMap(),
                            );
                          } catch (ex) {
                            log(ex.toString());
                          } finally {
                            NewsDetailScreen.selectedNewsDetails =
                                categoryNewsData[index];
                            Get.toNamed('/detail');
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: width,
                              height: 250,
                              margin: const EdgeInsets.only(bottom: 8),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Image.network(
                                categoryNewsData[index].urlToImage!,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
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
                                  categoryNewsData[index].title ==
                                          null
                                      ? '-'
                                      : 
                                         categoryNewsData[index].title!,
                                  style: textStyle(
                                      12, FontWeight.w500, Colors.white),
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
      ),
    );
  }
}
