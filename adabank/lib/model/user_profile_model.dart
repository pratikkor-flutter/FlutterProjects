import 'package:get/get.dart';

class UserProfileModel {
  final String name;
  // make balance Rx type, since it can be change when transaction initiated
  RxDouble balance;
  final String profilePic;
  final String bankNumber;
  final String mobileNumber;
  final String emailId;
  final String cashtag;
  final int idNo;
  final List contacts = const [
    {
      'name': "Ojaman",
      'profilePic': "assets/images/person1.png",
      'bankNumber': "0987 3422 8756",
    },
    {
      'name': "Mariana",
      'profilePic': "assets/images/person2.png",
      'bankNumber': "0987 3422 8756",
    },
    {
      'name': "Jimanti",
      'profilePic': "assets/images/person3.png",
      'bankNumber': "0987 3422 8756",
    },
    {
      'name': "Jumin",
      'profilePic': "assets/images/person4.png",
      'bankNumber': "0987 3422 8756",
    },
  ];
  final List transactionHistory = const [];

  UserProfileModel({
    required this.name,
    required this.balance,
    required this.profilePic,
    required this.bankNumber,
    required this.mobileNumber,
    required this.emailId,
    required this.cashtag,
    required this.idNo,
  });
}
