class TransactionPaymentTypeModel {
  int id;
  String name;

  TransactionPaymentTypeModel({required this.id, required this.name});

  factory TransactionPaymentTypeModel.fromJson(Map<String, dynamic> json) {
    return TransactionPaymentTypeModel(id: json['id'], name: json['name']);
  }
}
