import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:pp_cashier/controllers/recap.controller.dart';

class MainAppBar extends GetView<HomeController> {
  MainAppBar({Key? key}) : super(key: key);
  final cartCtrl = Get.find<CartController>();
  final memberCtrl = Get.find<MemberController>();
  final recapCtrl = Get.find<RecapController>();

  buildMainCTAButton(
    bool trueCondition,
  ) {
    return InkWell(
      onTap: () {
        if (trueCondition) {
          controller.cancelShopping();
          cartCtrl.cancelShopping();
        } else {
          controller.goMenu();
          controller.startShopping();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        decoration: customBoxDecoration(
          color: trueCondition ? cRed1 : cGreen1,
          // color: trueCondition ? cRed1 : cGreen1,
        ),
        child: Text(
          trueCondition ? 'BATALKAN PESANAN' : 'PESANAN BARU',
          style: kTextBold600.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  buildButton({
    required VoidCallback onTap,
    required bool trueCondition,
    required String text,
  }) {
    return InkWell(
      onTap: () {
        onTap();
        controller.cancelShopping();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              text,
              style: kTextBold600.copyWith(
                color: trueCondition
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: trueCondition ? cBlue2 : cBlue1,
              // height: 10,
              width: 100,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: cBlue1,
        ),
        height: 50,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/home-small.png'),
              Row(
                children: [
                  buildButton(
                    onTap: () {
                      controller.goDashboard();
                      memberCtrl.getActiveMembers();
                      memberCtrl.getAvailableCards();
                    },
                    trueCondition:
                        controller.appbarState == AppBarState.members,
                    text: 'REGISTRASI',
                  ),
                  buildButton(
                    onTap: () {
                      controller.goMenu();
                    },
                    trueCondition: controller.appbarState == AppBarState.menu,
                    text: 'RESTO',
                  ),
                  buildButton(
                    onTap: () {
                      controller.goTransaction();
                    },
                    trueCondition:
                        controller.appbarState == AppBarState.transaction,
                    text: 'TRANSAKSI',
                  ),
                  buildButton(
                    onTap: () {
                      controller.goToRecap();
                      recapCtrl.getCompletedMembers();
                    },
                    trueCondition: controller.appbarState == AppBarState.recap,
                    text: 'RECAP',
                  ),
                  // buildButton(
                  //   onTap: () {
                  //     controller.goToSettings();
                  //   },
                  //   trueCondition:
                  //       controller.appbarState == AppBarState.settings,
                  //   text: 'SETTINGS',
                  // ),
                ],
              ),
              buildMainCTAButton(
                controller.cartModeState == CartModeState.on,
              ),
            ],
          ),
        ));
  }
}
