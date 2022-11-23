import 'package:get/get.dart';
import 'package:pp_cashier/models/member-card.model.dart';
import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/services/http.service.dart';
import 'package:pp_cashier/consts/url.const.dart' as url;
import 'package:pp_cashier/utils/toast.helper.dart';

class MemberController extends GetxController {
  final _http = Get.find<HTTPService>();

  MemberController() {
    getActiveMembers();
    getAvailableCards();
  }

  final RxList<MemberModel> _members = <MemberModel>[].obs;
  List<MemberModel> get members => _members.toList();
  final RxList<MemberCardModel> _availableCards = <MemberCardModel>[].obs;
  List<MemberCardModel> get availableCards => _availableCards.toList();

  getAvailableCards() async {
    final cards = await fetchAvailableCards();
    _availableCards.assignAll(cards);
  }

  getActiveMembers() async {
    final mms = await fetchMembers();
    _members.assignAll(mms);
  }

  Future<List<MemberCardModel>> fetchAvailableCards() async {
    final res = await _http.get(route: url.memberGetAvailableCards);
    return (res as List).map((e) => MemberCardModel.fromJson(e)).toList();
  }

  Future<List<MemberModel>> fetchMembers() async {
    final res = await _http.get(route: url.memberGetActive);
    return (res as List).map((e) => MemberModel.fromJson(e)).toList();
  }

  createMember({
    required String name,
    required String phone,
    required String cardNo,
  }) async {
    await _http.post(route: url.memberCreateNew, body: {
      'name': name,
      'phone': phone,
      'cardNo': cardNo,
    });
    ToastHelper.success('Berhasil membuat member baru');
    getActiveMembers();
    getAvailableCards();
  }
}
