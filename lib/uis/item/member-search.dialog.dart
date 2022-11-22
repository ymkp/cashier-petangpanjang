import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/utils/logger.dart';

class MemberSearchDialog extends GetView<CartController> {
  MemberSearchDialog({Key? key}) : super(key: key);

  final TextEditingController _hiddenText = TextEditingController();
  final FocusNode _hiddenFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Cari Member Berdasar Kartu',
              style: kTextBold600.copyWith(
                color: cBlue1,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => Text(
                controller.searchedModel?.name ?? 'Belum ada member',
                style: kTextBold600.copyWith(
                  fontSize: 20,
                  color: cBlue1
                      .withOpacity(controller.searchedModel == null ? 0.5 : 1),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              autofocus: true,
              controller: _hiddenText,
              focusNode: _hiddenFocus,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Dekatkan kartu atau ketik nomor kartu',
                  border: InputBorder.none,
                  icon: const Icon(Icons.cast_rounded),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _hiddenText.clear();
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: cRed1,
                      ))),
              onFieldSubmitted: (String s) {
                controller.getSearchedMember(s);
                _hiddenText.clear();
                Logg.loggerprint('submitted : $s');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  if (controller.searchedModel != null) {
                    controller.selectMemberFromSearched();
                    Navigator.pop(context);
                  }
                },
                child: Obx(() => Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      alignment: Alignment.center,
                      width: 500,
                      decoration: customBoxDecoration(
                        color: cBlue1.withOpacity(
                            (controller.searchedModel == null) ? 0.2 : 1),
                      ),
                      child: Text(
                        'Pilih Member',
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
