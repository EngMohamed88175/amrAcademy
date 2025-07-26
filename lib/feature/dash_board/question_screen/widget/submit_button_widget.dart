import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/widgets/main_button_local/main_button_locald.dart';

class SubmitButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const SubmitButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MainButtonLocal(
      width: 20.w,
      height: 7.h,
      borderRadius: 10.sp,
      fontSizeText: 18.sp,
      fontSizeIcon: 0,
      text: "Submit",
      textColor: ColorsManger.white,
      isIconColor: false,
      onTap: onTap,
      backgroundColor: ColorsManger.primaryColor,
      isBorder: false,
      isIcon: false,
    );
  }
}
