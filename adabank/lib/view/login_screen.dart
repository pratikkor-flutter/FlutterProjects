import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adabank/bindings/bindings.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:adabank/view/pin/set_pin_screen.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  dynamic verificationBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.only(bottom: 25, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Verification Code",
                  style: textStyle(26, FontWeight.w600, Colors.black),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text:
                        "We have sent the code verification to\nyour mobile number. ",
                    style: textStyle(12, FontWeight.w400, Colors.black54),
                    children: [
                      TextSpan(
                        text: "Wrong number ?",
                        style: textStyle(12, FontWeight.w400, Colors.green),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${loginController.countryCode.value} ${loginController.phoneNumberFieldController.text}",
                    style: textStyle(15, FontWeight.w500, Colors.white),
                  ),
                ),
                const SizedBox(height: 35),
                Form(
                  key: loginController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textStyle: textStyle(22, FontWeight.w500, Colors.white),
                      length: 6,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        activeColor: Colors.white,
                        selectedColor: Colors.white,
                        inactiveColor: Colors.white,
                        selectedFillColor:
                            const Color.fromARGB(180, 9, 112, 62),
                        inactiveFillColor:
                            const Color.fromARGB(180, 9, 112, 62),
                        activeFillColor: const Color.fromARGB(180, 9, 112, 62),
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 60,
                        fieldWidth: 55,
                      ),
                      cursorColor: Colors.white,
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) async {
                        if (await loginController.signInWithOtp()) {
                          popScreen(context);
                          deleteLoginController();
                          pushScreen(context, const SetPinScreen());
                        } else {
                          Get.snackbar(
                            "Verification failed!",
                            "Incorrect OTP or something went wrong.",
                            backgroundColor:
                                const Color.fromARGB(155, 16, 96, 72),
                            duration: const Duration(milliseconds: 1500),
                            icon: const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.black,
                              size: 35,
                            ),
                          );
                        }
                      },
                      onChanged: (value) {
                        loginController.smsCode = value;
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Resend Code in 00:45",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 40,
                  child: SvgPicture.asset(
                    "assets/svg/Logo.svg",
                  ),
                ),
                Text(
                  "AdaBank",
                  style: textStyle(
                    34,
                    FontWeight.w500,
                    Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Welcome",
              style: textStyle(
                34,
                FontWeight.w600,
                Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Enter your mobile number  for Continue",
              style: textStyle(
                14,
                FontWeight.w400,
                Colors.black54,
              ),
            ),
          ),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 75,
                  child: DropdownButtonFormField(
                    value: loginController.value,
                    items: loginController.countryCodeDropdownMenu,
                    onChanged: (value) {
                      if (value == -1) {
                        loginController.countryCode.value =
                            loginController.countryCodeList[0];
                      } else {
                        loginController.countryCode.value =
                            loginController.countryCodeList[value];
                      }
                    },
                  ),
                ),
                Container(
                  width: width * 0.63,
                  height: 48,
                  padding: const EdgeInsets.only(top: 10),
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide())),
                  child: TextField(
                    controller: loginController.phoneNumberFieldController,
                    style: textStyle(22, FontWeight.w500, Colors.black),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 18),
                    ),
                    keyboardType: TextInputType.none,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          numPadWidget(
            context,
            loginController.phoneNumberFieldListener,
          ),
          GestureDetector(
            onTap: () async {
              if (await loginController.verifyPhoneNumber(
                  loginController.countryCode.value +
                      loginController.phoneNumberFieldController.text)) {
                verificationBottomSheet(context);
              } else {
                Get.snackbar(
                  "Warning! Enter Valid Phone Number",
                  "Be Wise, your phone number is required for verification.",
                  backgroundColor: const Color.fromARGB(155, 16, 96, 72),
                  duration: const Duration(milliseconds: 1500),
                  icon: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                );
              }
            },
            child: customButtonWidget(
              context: context,
              color: Theme.of(context).primaryColor,
              title: "NEXT",
              margin: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
