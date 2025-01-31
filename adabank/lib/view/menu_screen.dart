import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<List<String>> _shortcutsItem = [
  ["assets/svg/transfer.svg", "Send Money"],
  ["assets/svg/topup.svg", "Top-up Wallet"],
  ["assets/svg/bill.svg", "Bill Payment"],
  ["assets/svg/codeQR.svg", "Code QR"],
];

const List<List<String>> _moreMenuItem = [
  ["assets/svg/historyTransaction.svg", "History Transactions"],
  ["assets/svg/topup.svg", "Request Payment"],
  ["assets/svg/bill.svg", "Bill Payment"],
  ["assets/svg/transfer.svg", "Nearby Pay"],
];

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 96, 72),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 96, 72),
        leading: GestureDetector(
          onTap: () {
            popScreen(context);
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 16, 96, 72),
            ),
          ),
        ),
        title: Text(
          "Menu",
          style: textStyle(16, FontWeight.w500, Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            searchBar("Search Menu"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              child: Text(
                "Shortcuts",
                style: textStyle(14, FontWeight.w500, Colors.white),
              ),
            ),
            Container(
              height: 320,
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(_shortcutsItem[index][0]),
                  ),
                  title: Text(
                    _shortcutsItem[index][1],
                    style: textStyle(14, FontWeight.w500,
                        const Color.fromARGB(215, 255, 255, 255)),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.white24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              child: Text(
                "Other Menu",
                style: textStyle(14, FontWeight.w500, Colors.white),
              ),
            ),
            Container(
              height: 320,
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(_moreMenuItem[index][0]),
                  ),
                  title: Text(
                    _moreMenuItem[index][1],
                    style: textStyle(14, FontWeight.w500,
                        const Color.fromARGB(215, 255, 255, 255)),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
