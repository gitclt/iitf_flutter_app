import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

Text boldText(String label,
    {FontWeight? fontWeight = FontWeight.w600,
    double? fontSize,
    TextAlign? textAlign,
    Color? color = AppColor.blackColor}) {
  return Text(
    label,
    textAlign: textAlign,
    style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'Manrope',
        fontSize: fontSize ?? 13,
        color: color),
  );
}

Text xtraBoldText(String label, double fontSize,
    {FontWeight? fontWeight = FontWeight.w800,
    Color? color = AppColor.blackColor}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'Manrope',
        fontSize: fontSize,
        color: color),
  );
}

Text colorText(String label, double fontSize,
    {TextAlign? textAlign = TextAlign.center,
    FontWeight? fontWeight = FontWeight.w400,
    Color? color = AppColor.blackColor}) {
  return Text(
    label,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'Manrope',
        fontSize: fontSize,
        color: color),
  );
}

Text greyText(String label, 
    {TextAlign? textAlign = TextAlign.center,
    FontWeight? fontWeight = FontWeight.w400,
    }) {
  return Text(
    label,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'Manrope',
        fontSize: 14,
        color:  AppColor.grey1),
  );
}
