class ItemModel {
  int id;
  String name;
  int price;
  String? avatarDir;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.avatarDir,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      avatarDir: json['avatarDir'],
    );
  }
}
