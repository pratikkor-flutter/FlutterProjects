class ExpenseCategoryModel {
  final String category;
  final String categoryIcon;
  final int transactionCount;
  final String expenseAmount;
  final String lastTransactionDate;

  const ExpenseCategoryModel({
    required this.category,
    required this.categoryIcon,
    required this.transactionCount,
    required this.expenseAmount,
    required this.lastTransactionDate,
  });
}
