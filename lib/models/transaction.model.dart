import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/models/transaction-item.model.dart';

class TransactionModel {
  int id;
  List<TransactionItemModel> items;
  int price;
  int tax;
  int taxPctg;
  int service;
  int servicePctg;
  int total;
  MemberModel? member;
  String? closedAt;
  String createdAt;

  TransactionModel({
    required this.id,
    required this.items,
    required this.price,
    required this.tax,
    required this.taxPctg,
    required this.service,
    required this.servicePctg,
    required this.total,
    this.member,
    this.closedAt,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      items: json['items'] != null
          ? (json['items'] as List)
              .map((e) => TransactionItemModel.fromJson(e))
              .toList()
          : [],
      price: json['price'] ?? 0,
      tax: json['tax'] ?? 0,
      taxPctg: json['taxPctg'] ?? 0,
      service: json['service'] ?? 0,
      servicePctg: json['servicePctg'] ?? 0,
      total: json['total'] ?? 0,
      closedAt: json['closedAt'],
      createdAt: json['createdAt'] ?? '',
      member:
          json['member'] != null ? MemberModel.fromJson(json['member']) : null,
    );
  }
}
