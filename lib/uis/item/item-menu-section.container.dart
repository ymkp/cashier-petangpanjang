import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/uis/item/cart-sidebar.widget.dart';
import 'package:pp_cashier/uis/item/item-button.widget.dart';

class ItemMenuSectionContainer extends GetView<CartController> {
  ItemMenuSectionContainer({Key? key}) : super(key: key);

  final cf = NumberFormat.currency(symbol: 'Rp', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: customBoxDecoration(color: Colors.white),
            child: Obx(
              () => ListView(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                children: controller.categories
                    .map((c) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.name,
                              style: kTextBold600,
                            ),
                            const SizedBox(height: 10),
                            c.items.isEmpty
                                ? Center(
                                    child: Text(
                                      'Category tidak memiliki item',
                                      style: kTextMedium500.copyWith(
                                        color: cBlue1.withOpacity(0.5),
                                      ),
                                    ),
                                  )
                                : Wrap(
                                    children: c.items
                                        .map((item) => ItemButton(
                                              name: item.name,
                                              price: cf.format(item.price),
                                              avatarDir: item.avatarDir,
                                              onTap: () {
                                                if (controller.isCartMode) {
                                                  controller.addToCart(item);
                                                }
                                              },
                                            ))
                                        .toList()),
                            const SizedBox(height: 20),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        Obx(() => (controller.isCartMode) ? CartSidebar() : const SizedBox())
      ],
    );
  }
}
