import 'package:adabank/controller/profile/profile_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

detailProfileBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        controller: ProfileController.scrollController,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: MediaQuery.of(context).viewInsets,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 245, 245, 245),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Container(
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 245, 245),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0.1,
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 25,
                        height: 3.5,
                        color: Colors.grey[400],
                        margin: const EdgeInsets.only(top: 12, bottom: 15),
                        child: SingleChildScrollView(
                          controller: ProfileController.scrollController,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Detail Profile",
                          style: textStyle(16, FontWeight.w600, Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            ProfileController.isEdit.value =
                                !ProfileController.isEdit.value;
                          },
                          child: Obx(
                            () => Text(
                              ProfileController.isEdit.value ? "Edit" : "Done",
                              style: textStyle(
                                12,
                                FontWeight.w600,
                                const Color.fromARGB(255, 16, 96, 72),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 65,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "pratiks s. kor",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$Castag",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "\$nextarui",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Account Number",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "903402383011",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Text(
                      "Personal Information",
                      style: textStyle(16, FontWeight.w600, Colors.black),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "pratiks s. kor",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mobile Number",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "\$nextarui",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Id No",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "903402383011",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Npwp",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "903402383011",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Text(
                      "Device Information",
                      style: textStyle(16, FontWeight.w600, Colors.black),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Primary Device",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "pratiks s. kor",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "App Version",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        SizedBox(
                          width: 250,
                          height: 35,
                          child: Obx(
                            () => TextFormField(
                              readOnly: ProfileController.isEdit.value,
                              initialValue: "2.02.02",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
