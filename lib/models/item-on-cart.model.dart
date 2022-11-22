import 'package:pp_cashier/models/item.model.dart';

class ItemOnCartModel {
  int id;
  String name;
  int price;
  int qty;

  ItemOnCartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
  });

  ItemModel toItemModel() {
    return ItemModel(id: id, name: name, price: price);
  }
}
