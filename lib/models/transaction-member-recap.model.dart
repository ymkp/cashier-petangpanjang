// import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/models/transaction-payment-type.model.dart';

class TransactionMemberRecapModel {
  int id;
  int price;
  int tax;
  int taxPctg;
  int service;
  int servicePctg;
  int total;
  // MemberModel member;
  TransactionPaymentTypeModel? paymentType;
  int? paid;
  int? change;
  String? paymentAt;

  TransactionMemberRecapModel({
    required this.id,
    required this.price,
    required this.tax,
    required this.taxPctg,
    required this.service,
    required this.servicePctg,
    required this.total,
    // required this.member,
    this.paymentType,
    this.change,
    this.paid,
    this.paymentAt,
  });

  factory TransactionMemberRecapModel.fromJson(Map<String, dynamic> json) {
    return TransactionMemberRecapModel(
      id: json['id'],
      price: json['price'],
      tax: json['tax'],
      taxPctg: json['taxPctg'],
      service: json['service'],
      servicePctg: json['servicePctg'],
      total: json['total'],
      // member: MemberModel.fromJson(json['member']),
      change: json['change'],
      paid: json['paid'],
      paymentAt: json['paymentAt'],
      paymentType: json['paymentTYpe'] != null
          ? TransactionPaymentTypeModel.fromJson(json['paymentTYpe'])
          : null,
    );
  }
}
