import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:pp_cashier/uis/member/card-list-sidebar.widget.dart';
import 'package:pp_cashier/uis/member/create-member.dialog.dart';
import 'package:pp_cashier/uis/member/member-card.widget.dart';

class MemberSection extends GetView<MemberController> {
  const MemberSection({Key? key}) : super(key: key);

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Member',
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
                          'Daftarkan Member Baru',
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
                            'Belum ada member aktif',
                            style: kTextRegular400.copyWith(
                                color: cBlue1.withOpacity(0.4)),
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.start,
                          children: controller.members
                              .map((e) => MemberCard(member: e, onTap: () {}))
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
