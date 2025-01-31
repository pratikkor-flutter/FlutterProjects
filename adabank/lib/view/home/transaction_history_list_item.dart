import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';

class TransactionHistoryListItem extends StatelessWidget {
  const TransactionHistoryListItem({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: 6,
      controller: scrollController,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              transactionHistoryGroupbyCategory[index].categoryIcon,
            ),
          ),
          title: Text(
            transactionHistoryGroupbyCategory[index].category,
            style: textStyle(16, FontWeight.w500, Colors.black),
          ),
          subtitle: Text(
            transactionHistoryGroupbyCategory[index].lastTransactionDate,
            style: textStyle(12, FontWeight.w400, Colors.black54),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transactionHistoryGroupbyCategory[index].expenseAmount,
                style: textStyle(14, FontWeight.w500, Colors.black),
              ),
              Text(
                "Laptop Acer aspire 5",
                style: textStyle(12, FontWeight.w400, Colors.black54),
              ),
            ],
          ),
        );
      },
    );
  }
}
