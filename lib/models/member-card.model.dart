import 'package:pp_cashier/models/member.model.dart';

class MemberCardModel {
  int id;
  String cardNo;
  MemberModel? member;
  String? publishedAt;
  String? expiredAt;

  MemberCardModel({
    required this.id,
    required this.cardNo,
    this.member,
    this.publishedAt,
    this.expiredAt,
  });

  factory MemberCardModel.fromJson(Map<String, dynamic> json) {
    return MemberCardModel(
      id: json['id'] ?? 0,
      cardNo: json['cardNo'] ?? '',
    );
  }
}
