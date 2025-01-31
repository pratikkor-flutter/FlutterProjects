import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:flutter/material.dart';

class AllContactsListItem extends StatelessWidget {
  final ScrollController scrollController;
  const AllContactsListItem({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 60),
      itemCount: userProfile.contacts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage(
                      userProfile.contacts[index]['profilePic'],
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            title: Text(
              userProfile.contacts[index]['name'],
              style: textStyle(18, FontWeight.w500, Colors.black),
            ),
            subtitle: Text(
              "Bank - ${userProfile.contacts[index]['bankNumber']}",
              style: textStyle(12, FontWeight.w400, Colors.black87),
            ),
          ),
        );
      },
    );
  }
}
