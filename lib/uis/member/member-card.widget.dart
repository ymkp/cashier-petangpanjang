import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/models/member.model.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    required this.member,
    required this.onTap,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final MemberModel member;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: customBoxDecoration(
          color: (isSelected) ? cBlue2.withOpacity(0.1) : Colors.white,
          outlineColor: cBlue1,
        ),
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 400,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: kTextBold600.copyWith(color: cBlue1, fontSize: 16),
                ),
                Text(
                  DateFormat("EEEE, d MMMM yyyy HH:mm", "id_ID")
                      .format(DateTime.parse(member.startedAt)),
                  style: kTextMedium500.copyWith(
                    color: cBlue1,
                  ),
                )
              ],
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: cBlue2,
                    ),
                    Text(
                      member.phone,
                      style: kTextRegular400.copyWith(
                        color: cBlue2,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock,
                      color: cBlue2,
                    ),
                    Text(
                      member.cardNo,
                      style: kTextRegular400.copyWith(
                        color: cBlue2,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
