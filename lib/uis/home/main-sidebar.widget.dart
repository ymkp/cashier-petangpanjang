import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/uis/item/cart-sidebar.widget.dart';

class MainSidebar extends GetView<HomeController> {
  const MainSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Obx(
        () => Container(
          width: controller.cartModeState == CartModeState.on
              ? (MediaQuery.of(context).size.width / 3) > 450
                  ? 450
                  : MediaQuery.of(context).size.width / 3
              : 0,
          decoration: customBoxDecoration(color: Colors.white70),
          child: controller.cartModeState == CartModeState.on
              ? CartSidebar()
              : null,
        ),
      ),
    );
  }
}
