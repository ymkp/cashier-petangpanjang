import 'package:flutter/material.dart';
import 'package:pp_cashier/consts/theme.const.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {required this.price,
      required this.name,
      required this.qty,
      required this.onAdd,
      required this.onReduce,
      Key? key})
      : super(key: key);

  final String price;
  final String name;
  final int qty;
  final VoidCallback onReduce;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price,
          style: kTextMedium500.copyWith(
            fontSize: 20,
            color: cBlue1,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
                child: Text(
              name,
              style: kTextBold600.copyWith(
                fontSize: 18,
                color: cBlue1,
              ),
            )),
            Text(
              qty.toString(),
              style: kTextBold600.copyWith(
                fontSize: 18,
                color: cBlue1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                onReduce();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: customBoxDecoration(color: cRed1.withOpacity(0.1)),
                child: Text(
                  'Kurangi',
                  style: kTextMedium500.copyWith(
                    color: cRed1,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                onAdd();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration:
                    customBoxDecoration(color: cGreen1.withOpacity(0.1)),
                child: Text(
                  'Tambah',
                  style: kTextMedium500.copyWith(
                    color: cGreen1,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
