import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pp_cashier/consts/theme.const.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:flutter/material.dart';
import 'package:pp_cashier/utils/toast.helper.dart';

class CreateMemberDialog extends GetView<MemberController> {
  CreateMemberDialog({Key? key}) : super(key: key);

  final TextEditingController _nameTxtCtrl = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final TextEditingController _phoneTxtCtrl = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final TextEditingController _hiddenText = TextEditingController();
  final FocusNode _hiddenFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        width: MediaQuery.of(context).size.width / 1.5,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tambah Pelanggan',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Perlu diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintStyle: kTextRegular400.copyWith(
                        color: cBlue1.withOpacity(0.5)),
                    hintText: 'Nama pelanggan',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Perlu diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintStyle: kTextRegular400.copyWith(
                        color: cBlue1.withOpacity(0.5)),
                    hintText: 'Nomor telepon pelanggan',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Perlu diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintStyle: kTextRegular400.copyWith(
                        color: cBlue1.withOpacity(0.5)),
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
                    if (_formKey.currentState!.validate()) {
                      controller.createMember(
                          name: _nameTxtCtrl.text,
                          phone: _phoneTxtCtrl.text,
                          cardNo: _hiddenText.text);
                      Navigator.pop(context);
                    } else {
                      ToastHelper.warning('Periksa form ');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    alignment: Alignment.center,
                    width: 500,
                    decoration: customBoxDecoration(
                      color: cBlue1,
                    ),
                    child: Text(
                      'Tambah Pelanggan',
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
      ),
    );
  }
}
