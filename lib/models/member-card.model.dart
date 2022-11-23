class MemberCardModel {
  int id;
  String cardNo;
  String? lockerNo;

  MemberCardModel({
    required this.id,
    required this.cardNo,
    this.lockerNo,
  });

  factory MemberCardModel.fromJson(Map<String, dynamic> json) {
    return MemberCardModel(
        id: json['id'] ?? 0,
        cardNo: json['cardNo'] ?? '',
        lockerNo: json['lockerNo']);
  }
}
