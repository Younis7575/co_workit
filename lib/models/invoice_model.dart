class InvoiceModel {
  final int id;
  final String issueDate;
  final String dueDate;
  final String dueAmount;
  final String status;

  // Products Summary
  final int detailId;
  final String product;
  final String quantity;
  final String rate;
  final String discount;
  final String tax;
  final String description;
  final String price;

  InvoiceModel({
    required this.id,
    required this.issueDate,
    required this.dueDate,
    required this.dueAmount,
    required this.status,

    // Products Summary
    required this.detailId,
    required this.product,
    required this.rate,
    required this.discount,
    required this.tax,
    required this.description,
    required this.price,
    required this.quantity,
  });
}
