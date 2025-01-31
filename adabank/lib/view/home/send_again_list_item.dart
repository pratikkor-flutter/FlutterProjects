import 'package:adabank/view/transfer/transfer_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';

class SendAgainListItem extends StatelessWidget {
  const SendAgainListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      itemCount: userProfile.contacts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 32),
          child: GestureDetector(
            onTap: () {
              pushScreen(
                context,
                TransferDetailScreen(
                  transferContactDetail: userProfile.contacts[index],
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage(
                            userProfile.contacts[index]['profilePic']),
                        fit: BoxFit.fill),
                  ),
                ),
                const Spacer(),
                Text(userProfile.contacts[index]['name']),
              ],
            ),
          ),
        );
      },
    );
  }
}
