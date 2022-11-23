import 'package:get/get.dart';
import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/services/http.service.dart';
import 'package:pp_cashier/consts/url.const.dart' as url;

class MemberController extends GetxController {
  final _http = Get.find<HTTPService>();

  MemberController() {
    getActiveMembers();
  }

  final RxList<MemberModel> _members = <MemberModel>[].obs;
  List<MemberModel> get members => _members.toList();

  getActiveMembers() async {
    final mms = await fetchMembers();
    _members.assignAll(mms);
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
    await _http.post(
        route: url.memberCreateNew,
        body: {'name': name, 'phone': phone, 'cardNo': cardNo});
    getActiveMembers();
  }
}
