class TransactionModel {
  final String category;
  final String transactionNote;
  final String transactionDate;
  final double transactionAmount;

  const TransactionModel({
    required this.category,
    required this.transactionNote,
    required this.transactionDate,
    required this.transactionAmount,
  });
}
