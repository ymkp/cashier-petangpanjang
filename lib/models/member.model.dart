class MemberModel {
  int id;
  String name;
  String phone;
  String cardNo;
  String startedAt;
  String? stoppedAt;

  MemberModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.cardNo,
    required this.startedAt,
    this.stoppedAt,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        cardNo: json['cardNo'] ?? '',
        phone: json['phone'] ?? '',
        startedAt: json['startedAt'] ?? '',
        stoppedAt: json['stoppedAt']);
  }
}
