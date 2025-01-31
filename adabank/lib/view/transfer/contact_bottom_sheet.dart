import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/transfer/all_contacts_list_item.dart';
import 'package:adabank/view/transfer/recent_contacts_list_item.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';

class ContactBottomSheet extends StatelessWidget {
  const ContactBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.8,
      maxChildSize: 0.88,
      builder: (context, scrollController) => Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBar("Search Contact"),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Text(
                  "Recent Contacts",
                  style: textStyle(15, FontWeight.w500, Colors.black54),
                ),
              ),
              Container(
                height: 215,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const RecentContactsListItem(),
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
                color: Colors.black12,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Text(
                  "All Contacts",
                  style: textStyle(15, FontWeight.w500, Colors.black54),
                ),
              ),
              AllContactsListItem(
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
