import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/recap.controller.dart';
import 'package:pp_cashier/uis/member/member-card.widget.dart';
import 'package:pp_cashier/uis/recap/recap-sidebar.widget.dart';

class RecapSection extends GetView<RecapController> {
  const RecapSection({Key? key}) : super(key: key);

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
                      'Daftar Member Sudah Selesai',
                      style: kTextBold600.copyWith(
                        color: cBlue1,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                    child: Obx(
                  () => controller.completedMembers.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada member selesai',
                            style: kTextRegular400.copyWith(
                                color: cBlue1.withOpacity(0.4)),
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.start,
                          children: controller.completedMembers
                              .map((e) => MemberCard(
                                  member: e,
                                  isSelected:
                                      (controller.selectedMember?.id == e.id),
                                  onTap: () {
                                    controller
                                        .selectAndGetMemberComleteTrx(e.id);
                                  }))
                              .toList(),
                        ),
                )),
              ],
            ),
          ),
        ),
        RecapSidebar()
      ],
    );
  }
}
