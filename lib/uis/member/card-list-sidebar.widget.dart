import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/member.controller.dart';

class CardListSidebar extends GetView<MemberController> {
  const CardListSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 3) > 450
          ? 450
          : MediaQuery.of(context).size.width / 3,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            'Kartu Tersedia',
            style: kTextBold600.copyWith(
              color: cBlue1,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Obx(() => Wrap(
                children: controller.availableCards
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
                                e.cardNo,
                                style: kTextBold600.copyWith(color: cBlue1),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.lock,
                                    color: cBlue2,
                                  ),
                                  Text(
                                    e.lockerNo ?? 'unknown',
                                    style: kTextRegular400.copyWith(
                                      color: cBlue2,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ))
        ],
      ),
    );
  }
}
