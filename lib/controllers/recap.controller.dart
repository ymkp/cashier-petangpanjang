import 'package:get/get.dart';
import 'package:pp_cashier/models/member-complete.model.dart';
import 'package:pp_cashier/models/member.model.dart';
import 'package:pp_cashier/services/http.service.dart';
import 'package:pp_cashier/consts/url.const.dart' as url;

class RecapController extends GetxController {
  final _http = Get.find<HTTPService>();

  final RxList<MemberModel> _completedMembers = <MemberModel>[].obs;
  List<MemberModel> get completedMembers => _completedMembers.toList();
  final Rxn<MemberComplete> _selectedMember = Rxn<MemberComplete>();
  MemberComplete? get selectedMember => _selectedMember.value;

  getCompletedMembers() async {
    final cms = await fetchCompletedMembers();
    _completedMembers.assignAll(cms);
  }

  selectAndGetMemberComleteTrx(int id) async {
    _selectedMember.value = await fetchMemberTrxCompleteByMemberId(id);
  }

  Future<List<MemberModel>> fetchCompletedMembers() async {
    final res = await _http.get(route: url.memberGetCompleted);
    return (res as List).map((e) => MemberModel.fromJson(e)).toList();
  }

  Future<MemberComplete> fetchMemberTrxCompleteByMemberId(int id) async {
    final res = await _http.get(
        route: url.transactionCompleteGetMemberWithMemberId + id.toString());
    return MemberComplete.fromJson(res);
  }
}
