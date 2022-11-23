import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:flutter/material.dart';

class CreateMemberDialog extends GetView<MemberController> {
  CreateMemberDialog({Key? key}) : super(key: key);

  final TextEditingController _nameTxtCtrl = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final TextEditingController _phoneTxtCtrl = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
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
              'Tambah Member',
              style: kTextBold600.copyWith(
                color: cBlue1,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            Divider(color: cBlue1.withOpacity(0.5)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                autofocus: true,
                controller: _nameTxtCtrl,
                focusNode: _nameFocus,
                decoration: InputDecoration(
                  hintStyle:
                      kTextRegular400.copyWith(color: cBlue1.withOpacity(0.5)),
                  hintText: 'Nama ',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.person_add,
                    color: cBlue1.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: _phoneTxtCtrl,
                focusNode: _phoneFocus,
                decoration: InputDecoration(
                  hintStyle:
                      kTextRegular400.copyWith(color: cBlue1.withOpacity(0.5)),
                  hintText: 'Nomor telepon',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.phone,
                    color: cBlue1.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: _hiddenText,
                focusNode: _hiddenFocus,
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
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () async {
                  if ((_hiddenText.text.isEmpty ||
                      _nameTxtCtrl.text.isEmpty ||
                      _phoneTxtCtrl.text.isEmpty)) {
                  } else {
                    controller.createMember(
                        name: _nameTxtCtrl.text,
                        phone: _phoneTxtCtrl.text,
                        cardNo: _hiddenText.text);
                    Navigator.pop(context);
                    //////
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  width: 500,
                  decoration: customBoxDecoration(
                    color: cBlue1.withOpacity((_hiddenText.text.isEmpty ||
                            _nameTxtCtrl.text.isEmpty ||
                            _phoneTxtCtrl.text.isEmpty)
                        ? 0.2
                        : 1),
                  ),
                  child: Text(
                    'Tambahkan Member',
                    style: kTextBold600.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
