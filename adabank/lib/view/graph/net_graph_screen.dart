import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/graph/category_graph_screen.dart';
import 'package:adabank/view/graph/net_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetGraphScreen extends StatelessWidget {
  const NetGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: Colors.white70,
                ),
                Text(
                  "1 Sept 2021 - 31 Sept 2021",
                  style: textStyle(14, FontWeight.w400, Colors.white60),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$ ${userProfile.balance}",
                  style: textStyle(32, FontWeight.w500, Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 105,
            child: Container(
              width: width,
              height: height * 0.39,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const NetGraph(),
            ),
          ),
          Positioned(
            top: height - height * 0.39,
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 25),
                    child: Text(
                      "Transaction History",
                      style: textStyle(16, FontWeight.w500, Colors.black45),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12.5),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            pushScreen(
                              context,
                              CategoryGraphScreen(
                                category:
                                    transactionHistoryGroupbyCategory[index]
                                        .category,
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset(
                                transactionHistoryGroupbyCategory[index]
                                    .categoryIcon,
                                fit: BoxFit.none,
                              ),
                            ),
                            title: Text(
                              transactionHistoryGroupbyCategory[index].category,
                              style:
                                  textStyle(16, FontWeight.w500, Colors.black),
                            ),
                            subtitle: Text(
                              "${transactionHistoryGroupbyCategory[index].transactionCount} Transaction",
                              style: textStyle(
                                  12, FontWeight.w400, Colors.black54),
                            ),
                            trailing: Text(
                              "\$ ${transactionHistoryGroupbyCategory[index].expenseAmount}",
                              style:
                                  textStyle(14, FontWeight.w500, Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height - height * 0.45,
            left: width / 13,
            child: Container(
              width: width * 0.85,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 5,
                    blurRadius: 35,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Earned",
                        style: textStyle(12, FontWeight.w500, Colors.black45),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "\$ ${userProfile.balance}",
                        style: textStyle(
                          20,
                          FontWeight.w600,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Spent",
                        style: textStyle(12, FontWeight.w500, Colors.black45),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "\$ ${userProfile.balance}",
                        style: textStyle(
                          20,
                          FontWeight.w600,
                          const Color.fromARGB(255, 255, 114, 114),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
