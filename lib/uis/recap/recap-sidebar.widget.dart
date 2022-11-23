import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/recap.controller.dart';
import 'package:flutter/material.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';

class RecapSidebar extends GetView<RecapController> {
  RecapSidebar({Key? key}) : super(key: key);

  final cf = NumberFormat.currency(symbol: 'Rp', decimalDigits: 0);
  final trxCtrl = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: (MediaQuery.of(context).size.width / 3) > 450
            ? 450
            : MediaQuery.of(context).size.width / 3,
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => (controller.selectedMember == null)
              ? const SizedBox()
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
                                  controller.selectedMember!.name,
                                  style: kTextBold600.copyWith(
                                    fontSize: 18,
                                    color: cBlue1,
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat("EEEE, d MMMM yyyy HH:mm", "id_ID")
                                    .format(DateTime.parse(
                                  controller.selectedMember!.startedAt,
                                )),
                                style: kTextMedium500.copyWith(
                                  fontSize: 12,
                                  color: cBlue1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Divider(color: cBlue1.withOpacity(0.2)),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Expanded(
                      child: (controller.selectedMember!.transactions.isEmpty)
                          ? Center(
                              child: Text(
                                'Belum ada transaksi',
                                style: kTextBold600.copyWith(
                                  fontSize: 20,
                                  color: cBlue1.withOpacity(0.5),
                                ),
                              ),
                            )
                          : ListView(
                              shrinkWrap: true,
                              children: controller.selectedMember!.transactions
                                  .map(
                                    (trx) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                '#-ORD-${trx.id}',
                                                style: kTextBold600.copyWith(
                                                  color: cBlue1,
                                                ),
                                              )),
                                              Text(
                                                DateFormat(
                                                        "EEEE, d MMMM yyyy HH:mm",
                                                        "id_ID")
                                                    .format(DateTime.parse(
                                                  trx.createdAt,
                                                )),
                                                style: kTextMedium500.copyWith(
                                                  fontSize: 12,
                                                  color: cBlue1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            children: trx.items
                                                .map(
                                                  (item) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        bottom: 8,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  item.name,
                                                                  style: kTextRegular400
                                                                      .copyWith(
                                                                    fontSize:
                                                                        18,
                                                                    color:
                                                                        cBlue1,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                item.quantity
                                                                    .toString(),
                                                                style:
                                                                    kTextRegular400
                                                                        .copyWith(
                                                                  fontSize: 18,
                                                                  color: cBlue1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                '@ ${cf.format(item.price)}',
                                                                style:
                                                                    kTextRegular400
                                                                        .copyWith(
                                                                  fontSize: 11,
                                                                  color: cBlue2,
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )),
                                                )
                                                .toList(),
                                          ),
                                          Divider(
                                              color: cBlue1.withOpacity(0.1)),
                                        ],
                                      ),
                                    ),
                                  )
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
                                cf.format(controller
                                    .selectedMember!.transactionRecap.price),
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
                                  'TAX ${controller.selectedMember!.transactionRecap.taxPctg}%',
                                  style: kTextRegular400.copyWith(
                                    fontSize: 18,
                                    color: cBlue1,
                                  ),
                                ),
                              ),
                              Text(
                                cf.format(controller
                                    .selectedMember!.transactionRecap.tax),
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
                                cf.format(controller
                                    .selectedMember!.transactionRecap.service),
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
                              cf.format(controller
                                  .selectedMember!.transactionRecap.total),
                              style: kTextRegular400.copyWith(
                                fontSize: 18,
                                color: cBlue1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // ? BOX KALO BELUM BAYAR
                        (controller.selectedMember!.transactionRecap
                                    .paymentAt ==
                                null)
                            ? Column(
                                children: [
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            title: const Text('Pembayaran'),
                                            content: Text(
                                              'Bayar : ${cf.format(controller.selectedMember!.transactionRecap.total)} ? ',
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    await trxCtrl
                                                        .payTransaction(
                                                      trxId: controller
                                                          .selectedMember!
                                                          .transactionRecap
                                                          .id,
                                                      memberId: controller
                                                          .selectedMember!.id,
                                                      paid: controller
                                                          .selectedMember!
                                                          .transactionRecap
                                                          .total,
                                                    );

                                                    // return;
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Ya')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Tidak')),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
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
