import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/home/send_again_list_item.dart';
import 'package:adabank/view/home/transaction_history_list_item.dart';
import 'package:flutter/material.dart';

class HomeScreenBottomsheet extends StatelessWidget {
  const HomeScreenBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.46,
      minChildSize: 0.46,
      maxChildSize: 0.88,
      snap: true,
      snapAnimationDuration: const Duration(milliseconds: 500),
      builder: (context, scrollController) => Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 25,
                height: 3.5,
                color: Colors.grey[400],
                margin: const EdgeInsets.only(top: 8, bottom: 4),
                child: SingleChildScrollView(
                  controller: scrollController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 2.5, bottom: 5),
              child: Text(
                "Send Again",
                style: textStyle(15, FontWeight.w500, Colors.black54),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 112,
                child: SendAgainListItem(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 20),
              child: Text(
                "Transaction History",
                style: textStyle(15, FontWeight.w500, Colors.black54),
              ),
            ),
            Expanded(
              child: TransactionHistoryListItem(
                scrollController: scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
