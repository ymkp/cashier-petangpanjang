import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';
import 'package:flutter/material.dart';
import 'package:pp_cashier/models/transaction.model.dart';

class OrderCard extends GetView<TransactionController> {
  const OrderCard({
    required this.onTap,
    required this.trx,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final TransactionModel trx;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 4,
        ),
        decoration: customBoxDecoration(
          outlineColor: cBlue1,
          color: isSelected ? cBlue1.withOpacity(0.1) : Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Text(
                  DateFormat("EEEE, d MMMM yyyy HH:mm", "id_ID")
                      .format(DateTime.parse(trx.createdAt)),
                  maxLines: 3,
                  style: kTextRegular400.copyWith(
                    color: cBlue1,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '#-ORD-${trx.id}',
                  style: kTextBold600.copyWith(fontSize: 18, color: cBlue1),
                ),
                const SizedBox(height: 8),
                (trx.member == null)
                    ? Text(
                        'Tanpa Member',
                        style: kTextRegular400.copyWith(
                          color: cBlue1.withOpacity(0.4),
                          fontSize: 11,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        decoration: customBoxDecoration(
                          color: Colors.yellow.shade100,
                        ),
                        child: Text(
                          '${trx.member!.name} :',
                          style: kTextBold600.copyWith(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
              ]),
            ),
            trx.closedAt == null
                ? Container(
                    decoration: const BoxDecoration(
                        color: cBlue1,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(8))),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.center,
                    width: 500,
                    child: Text(
                      'OPEN',
                      style: kTextBold600.copyWith(color: Colors.white),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.center,
                    width: 500,
                    child: Text(
                      'Closed',
                      style: kTextRegular400.copyWith(color: cBlue1),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
