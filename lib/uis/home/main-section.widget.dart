import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/uis/member/member.-section.widget.dart';
import 'package:pp_cashier/uis/item/item-menu-section.container.dart';
import 'package:pp_cashier/uis/recap/recap-section.widget.dart';
import 'package:pp_cashier/uis/setting/setting-section.widget.dart';
import 'package:pp_cashier/uis/transaction/transaction-section.widget.dart';

class MainSection extends GetView<HomeController> {
  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.appbarState == AppBarState.menu) {
        return ItemMenuSectionContainer();
      } else if (controller.appbarState == AppBarState.transaction) {
        return TransactionSection();
      } else if (controller.appbarState == AppBarState.settings) {
        return const SettingSection();
      } else if (controller.appbarState == AppBarState.recap) {
        return const RecapSection();
      } else {
        return const MemberSection();
      }
    });
  }
}
