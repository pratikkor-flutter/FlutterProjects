import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/controller/transfer/transfer_screen_controller.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/transfer/transfer_detail_screen.dart';
import 'package:flutter/material.dart';

class RecentContactsListItem extends StatelessWidget {
  const RecentContactsListItem({super.key});

  bool _isBorderRecentContact(int index) {
    if (index == TransferScreenController.contactSelection.value) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      itemCount: userProfile.contacts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            TransferScreenController.contactSelection.value = index;
            Future.delayed(Durations.long1);
            pushScreen(
                context,
                TransferDetailScreen(
                  transferContactDetail: userProfile.contacts[index],
                ));
          },
          child: Container(
            width: 165,
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: _isBorderRecentContact(index)
                ? BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  )
                : const BoxDecoration(border: Border()),
            child: Column(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(
                        userProfile.contacts[index]['profilePic'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                Text(
                  userProfile.contacts[index]['name'],
                  style: textStyle(18, FontWeight.w500, Colors.black),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  "Bank - ${userProfile.contacts[index]['bankNumber']}",
                  style: textStyle(10, FontWeight.w400, Colors.black87),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
