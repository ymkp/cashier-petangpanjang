import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';
import 'package:flutter/material.dart';
import 'package:pp_cashier/uis/item/member-search.dialog.dart';

class TransactionSidebar extends GetView<TransactionController> {
  TransactionSidebar({Key? key}) : super(key: key);

  final cf = NumberFormat.currency(symbol: 'Rp', decimalDigits: 0);
  final cartCtrl = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => (controller.selectedTransaction == null)
              ? Container()
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '#-ORD-${controller.selectedTransaction!.id}',
                                  style: kTextBold600.copyWith(
                                    fontSize: 18,
                                    color: cBlue1,
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat("EEEE, d MMMM yyyy HH:mm", "id_ID")
                                    .format(DateTime.parse(
                                  controller.selectedTransaction!.createdAt,
                                )),
                                style: kTextMedium500.copyWith(
                                  fontSize: 12,
                                  color: cBlue1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (controller.selectedTransaction!.member == null)
                                  ? InkWell(
                                      onTap: () {
                                        cartCtrl.clearSelectedMember();
                                        showDialog(
                                            context: context,
                                            builder: (ctx) {
                                              return MemberSearchDialog();
                                            }).then((value) async {
                                          if (cartCtrl.selectedMember != null) {
                                            await controller
                                                .addMemberToSelectedMember(
                                              memberId:
                                                  cartCtrl.selectedMember!.id,
                                            );
                                          }
                                          cartCtrl.clearSearchedMember();
                                          cartCtrl.clearSelectedMember();
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        decoration: customBoxDecoration(
                                          color: cYellow1,
                                        ),
                                        child: Text(
                                          'Tambah Member',
                                          style: kTextBold600.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        decoration: customBoxDecoration(
                                          color: Colors.yellow.shade100,
                                        ),
                                        child: Text(
                                          '${controller.selectedTransaction!.member!.name} ',
                                          style: kTextBold600.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Divider(color: cBlue1.withOpacity(0.2)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: (controller.selectedTransaction!.items.isEmpty)
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
                              padding: const EdgeInsets.all(15),
                              shrinkWrap: true,
                              children: controller.selectedTransaction!.items
                                  .map((item) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item.name,
                                                style: kTextRegular400.copyWith(
                                                  fontSize: 18,
                                                  color: cBlue1,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              item.quantity.toString(),
                                              style: kTextRegular400.copyWith(
                                                fontSize: 18,
                                                color: cBlue1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                    ),
                    const SizedBox(height: 5),
                    Divider(color: cBlue1.withOpacity(0.2)),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'SubTotal',
                                  style: kTextRegular400.copyWith(
                                    fontSize: 18,
                                    color: cBlue1,
                                  ),
                                ),
                              ),
                              Text(
                                cf.format(
                                    controller.selectedTransaction!.price),
                                style: kTextRegular400.copyWith(
                                  fontSize: 18,
                                  color: cBlue1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'TAX ${controller.selectedTransaction!.taxPctg}%',
                                  style: kTextRegular400.copyWith(
                                    fontSize: 18,
                                    color: cBlue1,
                                  ),
                                ),
                              ),
                              Text(
                                cf.format(controller.selectedTransaction!.tax),
                                style: kTextRegular400.copyWith(
                                  fontSize: 18,
                                  color: cBlue1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Service ',
                                  style: kTextRegular400.copyWith(
                                    fontSize: 18,
                                    color: cBlue1,
                                  ),
                                ),
                              ),
                              Text(
                                cf.format(
                                    controller.selectedTransaction!.service),
                                style: kTextRegular400.copyWith(
                                  fontSize: 18,
                                  color: cBlue1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: customBoxDecoration(
                        color: cBlue2.withOpacity(0.1),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'TOTAL',
                                style: kTextRegular400.copyWith(
                                  fontSize: 18,
                                  color: cBlue1,
                                ),
                              ),
                            ),
                            Text(
                              cf.format(controller.selectedTransaction!.total),
                              style: kTextRegular400.copyWith(
                                fontSize: 18,
                                color: cBlue1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // ? BOX KALO BELUM BAYAR
                        (controller.selectedTransaction!.closedAt == null)
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13),
                                    alignment: Alignment.center,
                                    width: 500,
                                    decoration: customBoxDecoration(
                                        color: Colors.yellow),
                                    child: const Text('Tambah Pesanan',
                                        style: kTextBold600),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13),
                                    alignment: Alignment.center,
                                    width: 500,
                                    decoration:
                                        customBoxDecoration(color: cBlue1),
                                    child: Text(
                                      'BAYAR',
                                      style: kTextBold600.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13),
                                    alignment: Alignment.center,
                                    width: 500,
                                    decoration: customBoxDecoration(
                                        color: cRed1.withOpacity(0.1)),
                                    child: Text(
                                      'Batalkan Pesanan',
                                      style: kTextBold600.copyWith(
                                        color: cRed1,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox()

                        // ? BOX KALO UDAH BAYAR
                      ]),
                    ),
                  ],
                ),
        ));
  }
}
