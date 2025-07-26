import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class PoitExam extends StatelessWidget {
  const PoitExam({
    super.key,
    required this.points,
    required this.questionText,
  });

  final dynamic points;
  final dynamic questionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 5.w,
          height: 7.h,
          margin: EdgeInsets.symmetric(
              horizontal: 2.w),
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: ColorsManger.green
                .withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "$points",
              style: TextStyle(
                color: ColorsManger.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        Text(
          softWrap: true,
          overflow: TextOverflow.visible,
          questionText,
          style:
              StylesManager.style22Bold(context)
                  .copyWith(
            color: ColorsManger.white,
            fontSize: stv(
                context: context,
                mobile: 18.sp,
                tablet: 18.sp,
                desktop: 16.sp),
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
