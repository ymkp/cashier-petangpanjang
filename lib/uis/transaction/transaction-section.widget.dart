import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';
import 'package:pp_cashier/uis/item/member-search.dialog.dart';
import 'package:pp_cashier/uis/transaction/order-card.widget.dart';
import 'package:pp_cashier/uis/transaction/transaction-sidebar.widget.dart';
import 'package:pp_cashier/utils/logger.helper.dart';

class TransactionSection extends GetView<TransactionController> {
  TransactionSection({Key? key}) : super(key: key);
  final cartCtrl = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: customBoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Transaksi',
                      style: kTextBold600.copyWith(
                        color: cBlue1,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cartCtrl.clearSelectedMember();
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return MemberSearchDialog();
                            }).then((value) async {
                          if (cartCtrl.selectedMember != null) {
                            LoggerHelper.log(
                                'selected member is not null, get : ${cartCtrl.selectedMember!.cardNo}');
                            await controller.getTransactionCompleteFromCardNo(
                              cartCtrl.selectedMember!.cardNo,
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
                          'Pilih Member',
                          style: kTextBold600.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: cBlue2.withOpacity(0.3),
                  height: 5,
                ),
                const SizedBox(height: 10),
                Obx(
                  () => (controller.selectedMember == null)
                      ? Center(
                          child: Text(
                            'Belum ada member dipilih',
                            style: kTextMedium500.copyWith(
                                color: cBlue1.withOpacity(0.3)),
                          ),
                        )
                      : (controller.selectedMember!.transactions.isEmpty)
                          ? Center(
                              child: Text(
                                'Belum ada transaksi terdaftar',
                                style: kTextMedium500.copyWith(
                                    color: cBlue1.withOpacity(0.3)),
                              ),
                            )
                          : Wrap(
                              children: controller.selectedMember!.transactions
                                  .map(
                                    (t) => OrderCard(
                                      onTap: () {
                                        controller.selectTransaction(t);
                                      },
                                      isSelected:
                                          controller.selectedTransaction?.id ==
                                              t.id,
                                      trx: t,
                                    ),
                                  )
                                  .toList(),
                            ),
                ),
              ],
            ),
          ),
        ),
        TransactionSidebar()
      ],
    );
  }
}
