import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/graph/net_graph_widget.dart';
import 'package:flutter/material.dart';

class CategoryGraphScreen extends StatelessWidget {
  final String category;
  const CategoryGraphScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  category,
                  style: textStyle(14, FontWeight.w400, Colors.white),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "\$ ${transactionHistoryGroupbyCategory[0].expenseAmount}",
                  style: textStyle(32, FontWeight.w500, Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            child: Container(
              width: width,
              height: height * 0.39,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: const NetGraph(),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
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
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 25,
                      bottom: 5,
                    ),
                    child: Text(
                      "Transaction History",
                      style: textStyle(16, FontWeight.w500, Colors.black45),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: width - 25,
                    height: height * 0.37,
                    margin: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: transactionHistory.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            (transactionHistory[index]
                                        .transactionNote
                                        .split(" ")
                                        .length >=
                                    2)
                                ? transactionHistory[index]
                                        .transactionNote
                                        .split(" ")[0][0]
                                        .toUpperCase() +
                                    transactionHistory[index]
                                        .transactionNote
                                        .split(" ")[1][0]
                                        .toUpperCase()
                                : transactionHistory[index]
                                        .transactionNote
                                        .split(" ")[0][0]
                                        .toUpperCase() +
                                    transactionHistory[index]
                                        .transactionNote
                                        .split(" ")[0][1]
                                        .toUpperCase(),
                            style: textStyle(
                              14,
                              FontWeight.w500,
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        title: Text(
                          transactionHistory[index].transactionNote,
                          style: textStyle(16, FontWeight.w500, Colors.black),
                        ),
                        subtitle: Text(
                          transactionHistory[index].transactionDate,
                          style: textStyle(12, FontWeight.w400, Colors.black54),
                        ),
                        trailing: Text(
                          "\$ ${transactionHistory[index].transactionAmount}",
                          style: textStyle(14, FontWeight.w500, Colors.black),
                        ),
                      ),
                    ),
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
