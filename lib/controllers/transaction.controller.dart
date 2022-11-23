import 'package:get/get.dart';
import 'package:pp_cashier/models/member-complete.model.dart';
import 'package:pp_cashier/models/transaction.model.dart';
import 'package:pp_cashier/services/http.service.dart';
import 'package:pp_cashier/consts/url.const.dart' as url;
import 'package:pp_cashier/utils/toast.helper.dart';

class TransactionController extends GetxController {
  final _http = Get.find<HTTPService>();

  final Rxn<MemberComplete> _selectedMember = Rxn<MemberComplete>();
  MemberComplete? get selectedMember => _selectedMember.value;
  final Rxn<TransactionModel> _selectedTransaction = Rxn<TransactionModel>();
  TransactionModel? get selectedTransaction => _selectedTransaction.value;

  @override
  onReady() {}

  Future<void> getTransactionCompleteFromCardNo(String cardNo) async {
    _selectedMember.value = await fetchMemberTrxCompleteByCardNo(cardNo);
  }

  Future<List<TransactionModel>> fetchAllOrdersByCardNo(String cardNo) async {
    final res = await _http.get(route: url.transactionGetMembers + cardNo);
    return (res as List).map((e) => TransactionModel.fromJson(e)).toList();
  }

  selectTransaction(TransactionModel t) {
    _selectedTransaction.value = t;
  }

  createNewOrder(Map<String, dynamic> body) async {
    await _http.post(route: url.transactionCreate, body: body);
    ToastHelper.success('Berhasil membuat order');
  }

  payTransaction({
    required int trxId,
    required int memberId,
    required int paid,
  }) async {
    await _http.post(route: url.transactionPay, body: {
      'id': trxId,
      'memberId': memberId,
      'paid': paid,
      'paymentTypeId': 1,
    });
    _selectedTransaction.value = null;
    _selectedMember.value = null;
    ToastHelper.success('Berhasil membayar transaksi');
  }

  Future<MemberComplete> fetchMemberTrxCompleteByCardNo(String cardNo) async {
    final res = await _http.get(
        route: url.transactionCompleteGetMemberWithCardNo + cardNo);
    return MemberComplete.fromJson(res);
  }
}
