import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';
import 'package:pp_cashier/uis/member/card-list-sidebar.widget.dart';
import 'package:pp_cashier/uis/member/create-member.dialog.dart';
import 'package:pp_cashier/uis/member/member-card.widget.dart';

class MemberSection extends GetView<MemberController> {
  MemberSection({Key? key}) : super(key: key);

  final homeCtrl = Get.find<HomeController>();
  final trxCtrl = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: customBoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Pelanggan',
                      style: kTextBold600.copyWith(
                        color: cBlue1,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return CreateMemberDialog();
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        decoration: customBoxDecoration(
                          color: cYellow1,
                        ),
                        child: Text(
                          'Daftarkan pelanggan Baru',
                          style: kTextBold600.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                    child: Obx(
                  () => controller.members.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada pelanggan aktif',
                            style: kTextRegular400.copyWith(
                                color: cBlue1.withOpacity(0.4)),
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.start,
                          children: controller.members
                              .map((e) => MemberCard(
                                    member: e,
                                    onTap: () {
                                      homeCtrl.goTransaction();
                                      trxCtrl.getTransactionCompleteFromCardNo(
                                          e.cardNo);
                                    },
                                  ))
                              .toList(),
                        ),
                )),
              ],
            ),
          ),
        ),
        const CardListSidebar()
      ],
    );
  }
}
