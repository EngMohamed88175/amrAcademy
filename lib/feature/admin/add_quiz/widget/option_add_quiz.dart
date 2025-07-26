import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';

class OptionAddQuiz extends StatelessWidget {
  final String text;
  final String hitText;
  final TextEditingController controller;
  const OptionAddQuiz({
    super.key,
    required this.text,
    required this.hitText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: StylesManager.styleBold20(context)
                .copyWith(color: ColorsManger.black, fontSize: 18.sp)),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorsManger.gray.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hitText,
                hintStyle: TextStyle(
                  color: ColorsManger.black,
                  fontSize: 16.sp,
                )),
          ),
        )
      ],
    );
  }
}
