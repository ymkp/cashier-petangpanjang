import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:pp_cashier/uis/item/cart-item.widget.dart';
import 'package:pp_cashier/uis/item/member-search.dialog.dart';

class CartSidebar extends GetView<CartController> {
  CartSidebar({Key? key}) : super(key: key);
  final cf = NumberFormat.currency(symbol: 'Rp', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat("EEEE, d MMMM yyyy HH:mm", "id_ID")
                        .format(DateTime.now()),
                    style: kTextMedium500.copyWith(
                      color: cBlue1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return MemberSearchDialog();
                                  })
                              .then(
                                  (value) => controller.clearSearchedMember());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: customBoxDecoration(
                            color: cYellow1,
                          ),
                          child: Text(
                            controller.selectedMember?.name ?? 'Tambah Member',
                            style: kTextBold600.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      if (controller.selectedMember != null)
                        InkWell(
                            onTap: () {
                              controller.clearSelectedMember();
                            },
                            child: const Icon(
                              Icons.clear,
                              color: cRed1,
                            ))
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(color: cBlue1.withOpacity(0.2)),
                ],
              ),
            ),
            Expanded(
              child: (controller.itemsOnCart.isEmpty)
                  ? Center(
                      child: Text(
                        'Pilih item dulu',
                        style: kTextBold600.copyWith(
                          fontSize: 20,
                          color: cBlue1.withOpacity(0.5),
                        ),
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: controller.itemsOnCart
                          .map((item) => CartItemWidget(
                                price: cf.format(item.price),
                                name: item.name,
                                qty: item.qty,
                                onAdd: () {
                                  controller.addToCart(item.toItemModel());
                                },
                                onReduce: () {
                                  controller.removeFromCart(item.toItemModel());
                                },
                              ))
                          .toList(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: Obx(() => Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      alignment: Alignment.center,
                      width: 500,
                      decoration: customBoxDecoration(
                        color: cBlue1.withOpacity(
                            (controller.itemsOnCart.isEmpty) ? 0.2 : 1),
                      ),
                      child: Text(
                        'Buat Pesanan',
                        style: kTextBold600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
