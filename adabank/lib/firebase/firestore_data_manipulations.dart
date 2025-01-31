import 'package:adabank/model/transaction_model.dart';
import 'package:adabank/model/user_profile_model.dart';
import 'package:adabank/model/expense_category_model.dart';
import 'package:get/get.dart';

UserProfileModel userProfile = UserProfileModel(
  name: 'Pratik Kor',
  balance: 4355.0.obs,
  profilePic: 'assets/images/profile.png',
  bankNumber: '1234 5678 9012',
  mobileNumber: '+911234567890',
  emailId: 'pratik@is.great',
  cashtag: 'nextupi',
  idNo: 123456789012,
);

const List<ExpenseCategoryModel> transactionHistoryGroupbyCategory = [
  ExpenseCategoryModel(
    category: "Equipment",
    categoryIcon: "assets/svg/camera.svg",
    transactionCount: 4,
    expenseAmount: "220,98",
    lastTransactionDate: "17 Nov",
  ),
  ExpenseCategoryModel(
    category: "Entertainment",
    categoryIcon: "assets/svg/game.svg",
    transactionCount: 3,
    expenseAmount: "160,98",
    lastTransactionDate: "17 Nov",
  ),
  ExpenseCategoryModel(
    category: "Streaming",
    categoryIcon: "assets/svg/play.svg",
    transactionCount: 4,
    expenseAmount: "220,98",
    lastTransactionDate: "14 Nov",
  ),
  ExpenseCategoryModel(
    category: "Food",
    categoryIcon: "assets/svg/reserve.svg",
    transactionCount: 4,
    expenseAmount: "220,98",
    lastTransactionDate: "13 Nov",
  ),
  ExpenseCategoryModel(
    category: "Shopping",
    categoryIcon: "assets/svg/buy.svg",
    transactionCount: 4,
    expenseAmount: "220,98",
    lastTransactionDate: "12 Nov",
  ),
  ExpenseCategoryModel(
    category: "Travel",
    categoryIcon: "assets/svg/location.svg",
    transactionCount: 4,
    expenseAmount: "220,98",
    lastTransactionDate: "12 Nov",
  ),
];

const List<TransactionModel> transactionHistory = [
  TransactionModel(
    category: "Equipment",
    transactionNote: "Tokopedia",
    transactionDate: "26 Sept 2021",
    transactionAmount: 220.98,
  ),
  TransactionModel(
    category: "Equipment",
    transactionNote: "Apple Inc.",
    transactionDate: "26 Sept 2021",
    transactionAmount: 220.98,
  ),
  TransactionModel(
    category: "Equipment",
    transactionNote: "ElectronicWe",
    transactionDate: "26 Sept 2021",
    transactionAmount: 220.98,
  ),
  TransactionModel(
    category: "Equipment",
    transactionNote: "Tokopedia",
    transactionDate: "26 Sept 2021",
    transactionAmount: 220.98,
  ),
  TransactionModel(
    category: "Equipment",
    transactionNote: "Tokopedia",
    transactionDate: "26 Sept 2021",
    transactionAmount: 220.98,
  ),
  TransactionModel(
    category: "Equipment",
    transactionNote: "Tokopedia",
    transactionDate: "26 Sept 2021",
    transactionAmount: 220.98,
  ),
];
