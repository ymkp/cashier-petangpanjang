import 'package:flutter/material.dart';

const TextStyle kTextRegular400 = TextStyle(fontWeight: FontWeight.w400);
const TextStyle kTextMedium500 = TextStyle(fontWeight: FontWeight.w500);
const TextStyle kTextBold600 = TextStyle(fontWeight: FontWeight.w600);

const TextStyle tsCardTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 23);

const TextStyle tsSectionTitle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

const cBlue1 = Color(0xFF173656);
const cBlue2 = Color(0xFF2E87BB);
const cYellow1 = Color(0xFFFF9D2B);
const cGreen1 = Color(0xFF53C2A1);
const cRed1 = Color(0xFFE85656);
const cWhite1 = Color(0xFFE5E5E5);
const cWhite2 = Color(0xFFFFFFFF);
const cOutline1 = Color(0xFFD6E0ED);

BoxDecoration customBoxDecoration({Color? color, Color? outlineColor}) {
  return BoxDecoration(
    color: color ?? cWhite1,
    border: Border.all(
      color: outlineColor ?? color ?? cWhite1,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
