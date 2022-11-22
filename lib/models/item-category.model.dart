import 'package:pp_cashier/models/item.model.dart';

class ItemCategoryModel {
  int id;
  String name;
  String? avatarDir;
  List<ItemModel> items;

  ItemCategoryModel({
    required this.id,
    required this.name,
    required this.items,
    this.avatarDir,
  });

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) {
    return ItemCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatarDir: json['avatarDir'],
      items: json['items'] != null
          ? (json['items'] as List).map((e) => ItemModel.fromJson(e)).toList()
          : [],
    );
  }
}
