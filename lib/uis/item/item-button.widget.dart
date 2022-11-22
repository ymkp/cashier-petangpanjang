import 'package:flutter/material.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/uis/_shared/custom-cached-image.container.dart';

class ItemButton extends StatelessWidget {
  const ItemButton(
      {required this.name,
      required this.price,
      required this.onTap,
      this.avatarDir,
      Key? key})
      : super(key: key);

  final String name;
  final String price;
  final VoidCallback onTap;
  final String? avatarDir;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: customBoxDecoration(
          color: Colors.white,
          outlineColor: cOutline1,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomCachedImageContainer(imageURL: avatarDir ?? ''),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kTextBold600,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      price,
                      style: kTextBold600.copyWith(color: cYellow1),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
