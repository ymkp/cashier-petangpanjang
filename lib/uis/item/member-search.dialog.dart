import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/utils/logger.helper.dart';

class MemberSearchDialog extends GetView<CartController> {
  MemberSearchDialog({Key? key}) : super(key: key);

  final TextEditingController _hiddenText = TextEditingController();
  final FocusNode _hiddenFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        width: MediaQuery.of(context).size.width / 1.5,
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
            const SizedBox(height: 15),
            Divider(color: cBlue1.withOpacity(0.5)),
            const SizedBox(height: 30),
            Obx(
              () => Text(
                (controller.searchedModel != null)
                    ? controller.searchedModel!.name
                    : 'Belum ada member',
                style: kTextBold600.copyWith(
                  fontSize: 20,
                  color: cBlue1
                      .withOpacity(controller.searchedModel == null ? 0.5 : 1),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                autofocus: true,
                controller: _hiddenText,
                focusNode: _hiddenFocus,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle:
                      kTextRegular400.copyWith(color: cBlue1.withOpacity(0.5)),
                  hintText: 'Dekatkan kartu atau ketik nomor kartu',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.cast_rounded,
                    color: cBlue1.withOpacity(0.4),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _hiddenText.clear();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: cRed1,
                    ),
                  ),
                ),
                onFieldSubmitted: (String s) {
                  controller.getSearchedMember(s);

                  _hiddenText.clear();
                  _hiddenFocus.requestFocus();
                  LoggerHelper.log('submitted : $s');
                },
              ),
            ),
            const SizedBox(height: 30),
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
