class TransactionItemModel {
  int id;
  String name;
  int price;
  int tax;
  int totalPrice;
  int totalTax;
  int total;
  int quantity;

  TransactionItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.tax,
    required this.total,
    required this.totalPrice,
    required this.quantity,
    required this.totalTax,
  });

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) {
    return TransactionItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      tax: json['tax'],
      total: json['total'],
      totalPrice: json['totalPrice'],
      quantity: json['quantity'],
      totalTax: json['totalTax'],
    );
  }
}
