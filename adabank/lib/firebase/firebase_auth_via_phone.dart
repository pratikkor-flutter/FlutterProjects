// // phone verification
//   Future<bool> verifyPhoneNumber(String phoneNumber) async {
//     if (phoneNumber.length == 13) {
//       try {
//         await _auth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await _auth.signInWithCredential(credential);
//             Get.snackbar(
//               "Verification Successful",
//               "Phone number automatically verified and user signed in.",
//               backgroundColor: const Color.fromARGB(155, 16, 96, 72),
//               duration: const Duration(milliseconds: 1500),
//               icon: const Icon(
//                 Icons.check_circle_outline_rounded,
//                 color: Colors.black,
//                 size: 35,
//               ),
//             );
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             Get.snackbar(
//               "Verification failed!",
//               "${e.message}",
//               backgroundColor: const Color.fromARGB(155, 16, 96, 72),
//               duration: const Duration(milliseconds: 1500),
//               icon: const Icon(
//                 Icons.warning_amber_rounded,
//                 color: Colors.black,
//                 size: 35,
//               ),
//             );
//           },
//           codeSent: (String verificationId, int? resendToken) {
//             this.verificationId = verificationId;
//             this.phoneNumber = phoneNumber;
//             Get.snackbar(
//               "Verification code sent",
//               "Enter your verification code onto below field.",
//               backgroundColor: const Color.fromARGB(155, 16, 96, 72),
//               duration: const Duration(milliseconds: 1500),
//               icon: const Icon(
//                 Icons.check_circle_outline_rounded,
//                 color: Colors.black,
//                 size: 35,
//               ),
//             );
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             this.verificationId = verificationId;
//           },
//         );

//         return true;
//       } catch (exception) {
//         log(exception.toString());
//         return false;
//       }
//     } else {
//       return false;
//     }
//   }

//   // otp verification
//   Future<bool> signInWithOtp() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );
//     try {
//       await _auth.signInWithCredential(credential);
//       Get.snackbar(
//         "Verification Successful",
//         "Phone number verified successfully & User Registered.",
//         backgroundColor: const Color.fromARGB(155, 16, 96, 72),
//         duration: const Duration(milliseconds: 1500),
//         icon: const Icon(
//           Icons.check_circle_outline_rounded,
//           color: Colors.black,
//           size: 35,
//         ),
//       );

//       SessionController.storePhoneToken(
//         loginStatus: true,
//         phoneNumber: phoneNumber,
//       );

//       return true;
//     } catch (exception) {
//       log(exception.toString());
//       return false;
//     }
//   }