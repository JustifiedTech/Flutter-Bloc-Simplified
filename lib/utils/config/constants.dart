import 'package:flutter/material.dart';
import 'package:new_app/utils/config/size_config.dart';

const kBlack = Color(0xFF3B3B3B);

const kPurple = Color(0xFF7765C4);

const kDarkpurple = Color(0xFF6C648E);
const kGreen = Color(0xFF65C4AD);
const kGrey = Color(0xFF707070);
const kList = Color(0xFFFAF9FF);
const kRed = Color(0xFFE47673);
const kPurpleA = Color.fromARGB(10, 119, 101, 196);

TextStyle textStyle(double size,
    {Color color = kBlack, fontWeight = FontWeight.w400}) {
  return TextStyle(
    fontSize: getProportionateScreenWidth(size),
    color: color,
    fontWeight: fontWeight,
  );
}
