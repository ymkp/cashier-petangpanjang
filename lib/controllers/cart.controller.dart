import 'package:get/get.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/models/item-category.model.dart';
import 'package:pp_cashier/models/item-on-cart.model.dart';
import 'package:pp_cashier/models/item.model.dart';
import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/services/http.service.dart';
import 'package:pp_cashier/consts/url.const.dart' as url;
import 'package:pp_cashier/utils/logger.dart';

class CartController extends GetxController {
  final _http = Get.find<HTTPService>();
  final _homeCtrl = Get.find<HomeController>();
  final RxList<ItemOnCartModel> _itemsOnCart = <ItemOnCartModel>[].obs;
  List<ItemOnCartModel> get itemsOnCart => _itemsOnCart.toList();
  final RxList<ItemCategoryModel> _categories = <ItemCategoryModel>[].obs;
  List<ItemCategoryModel> get categories => _categories.toList();
  final Rxn<MemberModel> _selectedMember = Rxn<MemberModel>();
  MemberModel? get selectedMember => _selectedMember.value;
  final Rxn<MemberModel> _searchedModel = Rxn<MemberModel>();
  MemberModel? get searchedModel => _searchedModel.value;

  bool get isCartMode => _homeCtrl.isCartMode;

  @override
  onReady() {
    getAllCategories();
  }

  cancelShopping() {
    _itemsOnCart.clear();
    clearSelectedMember();
    clearSearchedMember();
  }

  clearSelectedMember() {
    _selectedMember.value = null;
  }

  selectMemberFromSearched() {
    _selectedMember.value = searchedModel;
  }

  clearSearchedMember() {
    Logg.loggerprint('clear search member');
    _searchedModel.value = null;
  }

  ///  add item to  cart
  addToCart(ItemModel item) {
    final idx = _itemsOnCart.indexWhere((element) => element.id == item.id);
    if (idx == -1) {
      _itemsOnCart.add(ItemOnCartModel(
        id: item.id,
        name: item.name,
        price: item.price,
        qty: 1,
      ));
    } else {
      _itemsOnCart[idx] = ItemOnCartModel(
        id: itemsOnCart[idx].id,
        name: itemsOnCart[idx].name,
        price: itemsOnCart[idx].price,
        qty: itemsOnCart[idx].qty + 1,
      );
    }
  }

  /// remove item from cart
  removeFromCart(ItemModel item) {
    final idx = _itemsOnCart.indexWhere((element) => element.id == item.id);
    if (idx == -1) {
    } else {
      if (_itemsOnCart[idx].qty == 1) {
        _itemsOnCart.removeAt(idx);
      } else {
        _itemsOnCart[idx] = ItemOnCartModel(
          id: itemsOnCart[idx].id,
          name: itemsOnCart[idx].name,
          price: itemsOnCart[idx].price,
          qty: itemsOnCart[idx].qty - 1,
        );
      }
    }
  }

  getSearchedMember(String cardNo) async {
    _searchedModel.value = await fetchMemberByCardNo(cardNo);
  }

  getAllCategories() async {
    final res = await fetchAllCategoriesAndMenu();
    _categories.assignAll(res);
  }

  Future<MemberModel> fetchMemberByCardNo(String cardNo) async {
    final res = await _http
        .post(route: url.memberSearchCardNo, body: {'cardNo': cardNo});
    return MemberModel.fromJson(res);
  }

  // ? get all categories and its menus
  Future<List<ItemCategoryModel>> fetchAllCategoriesAndMenu() async {
    final res = await _http.get(route: url.itemGetCategoriesAndMenus);
    return (res as List).map((e) => ItemCategoryModel.fromJson(e)).toList();
  }

  // ? get all categories
  Future<List<ItemCategoryModel>> fetchAllCategories() async {
    final res = await _http.get(route: url.itemGetAllCategory);
    return (res as List).map((e) => ItemCategoryModel.fromJson(e)).toList();
  }

  // ? get all menu by category
  Future<List<ItemModel>> getItemsByCategoryId(int id) async {
    final res = await _http.get(
      route: url.itemGetMenuByCategory + id.toString(),
    );
    return (res as List).map((e) => ItemModel.fromJson(e)).toList();
  }
}
