import 'package:get/get.dart';
import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/models/transaction.model.dart';
import 'package:pp_cashier/services/http.service.dart';
import 'package:pp_cashier/consts/url.const.dart' as url;
import 'package:pp_cashier/utils/logger.dart';

class TransactionController extends GetxController {
  final _http = Get.find<HTTPService>();

  final Rxn<TransactionModel> _selectedTransaction = Rxn<TransactionModel>();
  TransactionModel? get selectedTransaction => _selectedTransaction.value;

  final RxList<TransactionModel> _transactions = <TransactionModel>[].obs;
  List<TransactionModel> get transactions => _transactions.toList();

  final Rxn<MemberModel> _searchedModel = Rxn<MemberModel>();
  MemberModel? get searchedModel => _searchedModel.value;

  @override
  onReady() {}

  selectTransaction(TransactionModel trx) {
    _selectedTransaction.value = trx;
  }

  getAllTransactions(String cardNo) async {
    Logg.loggerprint(cardNo);
    final trxs = await fetchAllOrdersByCardNo(cardNo);
    _transactions.assignAll(trxs);
  }

  Future<List<TransactionModel>> fetchAllOrdersByCardNo(String cardNo) async {
    final res = await _http.get(route: url.transactionGetMembers + cardNo);
    return (res as List).map((e) => TransactionModel.fromJson(e)).toList();
  }

  createNewOrder(Map<String, dynamic> body) async {
    await _http.post(route: url.transactionCreate, body: body);
  }

  clearSearchedMember() {
    _searchedModel.value = null;
  }

  getSearchedMember(String cardNo) async {
    _searchedModel.value = await fetchMemberByCardNo(cardNo);
  }

  Future<MemberModel> fetchMemberByCardNo(String cardNo) async {
    final res = await _http
        .post(route: url.memberSearchCardNo, body: {'cardNo': cardNo});
    return MemberModel.fromJson(res);
  }

  Future<void> addMemberToSelectedMember({int? memberId}) async {
    final res = await _http.patch(
        route: url.transactionEditMember,
        body: {'id': selectedTransaction!.id, 'memberId': memberId});
    _selectedTransaction.value = TransactionModel.fromJson(res);
  }
}
