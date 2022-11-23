import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';
import 'package:pp_cashier/uis/item/cart-sidebar.widget.dart';
import 'package:pp_cashier/uis/transaction/transaction-sidebar.widget.dart';

class MainSidebar extends GetView<HomeController> {
  MainSidebar({Key? key}) : super(key: key);
  final trxCtrl = Get.find<TransactionController>();
  final cartCtrl = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10),
      child: Obx(
        () => Container(
            width: ((controller.cartModeState == CartModeState.on &&
                        controller.appbarState == AppBarState.menu) ||
                    (controller.appbarState == AppBarState.transaction &&
                        trxCtrl.selectedTransaction != null))
                ? (MediaQuery.of(context).size.width / 3) > 450
                    ? 450
                    : MediaQuery.of(context).size.width / 3
                : 0,
            decoration: customBoxDecoration(color: Colors.white70),
            child: (controller.appbarState == AppBarState.menu &&
                    cartCtrl.isCartMode)
                ? CartSidebar()
                : (controller.appbarState == AppBarState.transaction)
                    ? TransactionSidebar()
                    : null),
      ),
    );
  }
}
