class MemberModel {
  int id;
  String name;
  String memberNo;

  MemberModel({
    required this.id,
    required this.name,
    required this.memberNo,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      memberNo: json['memberNo'] ?? '',
    );
  }
}
