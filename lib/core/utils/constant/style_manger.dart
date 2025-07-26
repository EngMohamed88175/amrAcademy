import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

abstract class StylesManager {
  StylesManager._();

  static TextStyle styleRegular16(context) {
    return const TextStyle(
      color: Color(0xFF064060),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style22Bold(context) {
    return const TextStyle(
      color: ColorsManger.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return const TextStyle(
      color: ColorsManger.white,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return const TextStyle(
      color: ColorsManger.white,
    );
  }

  static TextStyle styleBold30(BuildContext context) {
    return const TextStyle(
      
      color: ColorsManger.black,
      fontWeight: FontWeight.bold,
      // fontFamily: "ProtestGuerrilla-Regular",
    );
  }

  static TextStyle styleBold35Regular(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      // fontFamily: "ProtestGuerrilla-Regular",
    );
  }

  static TextStyle styleBold20ReemKufi(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorsManger.white,
      // fontFamily: "ReemKufi",
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return const TextStyle(
      color: Color(0xFF064061),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return const TextStyle(
      color: Color(0xFF064061),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return const TextStyle(
      color: Color(0xFFAAAAAA),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return const TextStyle(
      color: Color(0xFF4EB7F2),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return const TextStyle(
      color: Color(0xFFAAAAAA),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style23Bold(BuildContext context) {
    return const TextStyle(
      overflow: TextOverflow.ellipsis,
      color: ColorsManger.cyanBlue,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style55Bold(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorsManger.white,
    );
  }

  static TextStyle style30Almarai(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp,
      // fontFamily: "Almarai",
      color: ColorsManger.black,
    );
  }

  static TextStyle style25PlayfairDisplay(BuildContext context) {
    return const TextStyle(
      // fontFamily: "PlayfairDisplay",
      color: ColorsManger.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style18Bold(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
    );
  }

  static TextStyle style16Regular(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodyLarge!.color,
    );
  }
}
