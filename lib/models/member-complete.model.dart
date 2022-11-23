import 'package:pp_cashier/models/member-card.model.dart';
import 'package:pp_cashier/models/transaction-member-recap.model.dart';
import 'package:pp_cashier/models/transaction.model.dart';

class MemberComplete {
  int id;
  String name;
  String phone;
  String cardNo;
  MemberCardModel card;
  String startedAt;
  List<TransactionModel> transactions;
  TransactionMemberRecapModel transactionRecap;
  String? stoppedAt;

  MemberComplete({
    required this.id,
    required this.name,
    required this.phone,
    required this.cardNo,
    required this.card,
    required this.startedAt,
    required this.transactions,
    required this.transactionRecap,
    this.stoppedAt,
  });

  factory MemberComplete.fromJson(Map<String, dynamic> json) {
    return MemberComplete(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      cardNo: json['cardNo'],
      card: MemberCardModel.fromJson(json['card']),
      startedAt: json['startedAt'],
      transactions: (json['transactions'] == null)
          ? []
          : (json['transactions'] as List)
              .map((e) => TransactionModel.fromJson(e))
              .toList(),
      transactionRecap:
          TransactionMemberRecapModel.fromJson(json['transactionRecap']),
      stoppedAt: json['stoppedAt'],
    );
  }
}
