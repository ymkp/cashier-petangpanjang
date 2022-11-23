import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:pp_cashier/uis/dashboard/create-member.dialog.dart';

class DashboardSection extends GetView<MemberController> {
  const DashboardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
            () => Wrap(
              children: controller.members
                  .map((e) => Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: customBoxDecoration(
                          color: Colors.white,
                          outlineColor: cBlue1,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 400,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.name,
                              style: kTextMedium500.copyWith(
                                  color: cBlue1, fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              e.phone,
                              style: kTextRegular400.copyWith(
                                fontSize: 10,
                                color: cBlue1,
                              ),
                            ),
                            Text(
                              e.cardNo,
                              style: kTextRegular400.copyWith(
                                fontSize: 10,
                                color: cBlue1,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )),
        ],
      ),
    );
  }
}
